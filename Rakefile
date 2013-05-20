#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
FeedEngine::Application.load_tasks

require 'resque/tasks'

redis_url = ENV["REDISTOGO_URL"] || 'redis://localhost:6379'

uri = URI.parse(redis_url)
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

Resque.server = REDIS

task "resque:setup" => :environment do

  Resque.before_fork = Proc.new { ActiveRecord::Base.establish_connection }
end

require_relative 'app/jobs/tweet_for_all_users'
task :tweet_for_all_users, :environment do
  Resque.enqueue(TweetForAllUsers)
end

task "jobs:work" => :environment do
  ENV["QUEUE"]="*"
  Rake::Task["resque:work"].execute
end