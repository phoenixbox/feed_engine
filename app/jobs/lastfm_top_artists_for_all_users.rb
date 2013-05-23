require 'logger'

class LastfmTopArtistsForAllUsers
  @queue = :lastfm_top_artists_for_all_users

  def self.perform(options = {})
    User.all.each do |user|
      log.info "Fetching Lastfm artists for #{user.id}"
      Resque.enqueue(LastfmTopArtists, {:user_id => user.id})
    end
  end

  def self.log
    @logger ||= Logger.new(STDOUT)
  end
end
