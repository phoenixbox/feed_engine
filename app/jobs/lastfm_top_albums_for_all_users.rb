require 'logger'

class LastfmTopAlbumsForAllUsers
  @queue = :lastfm_top_albums_for_all_users

  def self.perform(options = {})
    User.all.each do |user|
      log.info "Fetching Lastfm albums for #{user.id}"
      Resque.enqueue(LastfmTopAlbums, {:user_id => user.id})
    end
  end

  def self.log
    @logger ||= Logger.new(STDOUT)
  end
end
