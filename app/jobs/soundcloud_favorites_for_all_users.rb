require 'logger'

class SoundcloudFavoritesForAllUsers
  @queue = :soundcloud_favorites_for_all_users

  def self.perform(options = {})
    User.all.each do |user|
      log.info "Fetching Soundcloud favorites for #{user.id}"
      Resque.enqueue(SoundcloudFavorites, {:user_id => user.id})
    end
  end

  def self.log
    @logger ||= Logger.new(STDOUT)
  end
end
