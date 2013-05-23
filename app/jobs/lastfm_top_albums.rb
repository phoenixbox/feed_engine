require 'logger'

class LastfmTopAlbums
  @queue = :lastfm_top_albums

  def self.perform(options = {})
    log.info "Creating Lastfm top albums for #{options["user_id"]}"
    LastfmTopAlbum.update_top_albums_for_user(options["user_id"])
    log.info "Completed creating Lastfm top albums for #{options["user_id"]}"
  end

  def self.log
    @logger ||= Logger.new(STDOUT)
  end
end
