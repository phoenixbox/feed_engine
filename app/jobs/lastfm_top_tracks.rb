require 'logger'

class LastfmTopTracks
  @queue = :lastfm_top_tracks

  def self.perform(options = {})
    log.info "Creating Lastfm top tracks for #{options["user_id"]}"
    LastfmTopTrack.update_top_tracks_for_user(options["user_id"])
    log.info "Completed creating Lastfm top tracks for #{options["user_id"]}"
  end

  def self.log
    @logger ||= Logger.new(STDOUT)
  end
end
