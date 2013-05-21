require 'logger'

class TweetUpdates
  @queue = :tweet_updates

  def self.perform(options = {})
    log.info "Creating mentions for #{options["user_id"]}"
    user = User.find(options["user_id"])
    user.create_from_mentions
    log.info "Completed creating mentions for #{options["user_id"]}"
  end

  def self.log
    @logger ||= Logger.new(STDOUT)
  end
end