require 'logger'

class LastfmTopArtists
  @queue = :lastfm_top_artists

  def self.perform(options = {})
    log.info "Creating Lastfm top artists for #{options["user_id"]}"
    LastfmTopArtist.update_top_artists_for_user(options["user_id"])
    log.info "Completed creating Lastfm top artists for #{options["user_id"]}"
  end

  def self.log
    @logger ||= Logger.new(STDOUT)
  end
end

