require 'logger'

class TweetForAllUsers
  @queue = :tweet_for_all_users

  def self.perform(options = {})
    User.all.each do |user|
      log.info "Fetching tweets for #{user.id}"
      Resque.enqueue(1.minutes, TweetUpdates, {:user_id => user.id})
    end
  end

  def self.log
    @logger ||= Logger.new(STDOUT)
  end
end