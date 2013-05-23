require 'logger'

class LastfmTopTracksForAllUsers
  @queue = :lastfm_top_tracks_for_all_users

  def self.perform(options = {})
    User.all.each do |user|
      log.info "Fetching Lastfm tracks for #{user.id}"
      Resque.enqueue(LastfmTopTracks, {:user_id => user.id})
    end
  end

  def self.log
    @logger ||= Logger.new(STDOUT)
  end
end
