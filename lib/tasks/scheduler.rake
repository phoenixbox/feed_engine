desc "This task is called by the Heroku scheduler add-on"
task :update_tweets_for_users => :environment do
  puts "Updating tweets..."
  TweetForAllUsers.perform
  puts "done."
end
