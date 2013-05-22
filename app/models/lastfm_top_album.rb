class LastfmTopAlbum < FeedItem

  def self.update_all
    User.all.each do |user|
      unless user.lastfm_auths.empty?
        update_top_albums_for_user(user.id)
      end
    end
  end

  def valid_attrs
    %[rank name artist image_url]
  end

  def self.update_top_albums_for_user(user_id)
    user = User.find(user_id)
    unless user.lastfm_auths.empty?
      lastfm = Lastfm.new(ENV["LASTFM_CONSUMER_KEY"], ENV["LASTFM_CONSUMER_SECRET"])
      # dont want this to fire until I have authorised the token
      token = user.lastfm_auths.first.token
      lastfm.session = token

      lastfm_username = lastfm.user.get_info["name"]

      top_albums = lastfm.user.get_top_albums(lastfm_username).first(9)

      top_albums.each do |album|
        if album["image"]
          user.lastfm_top_albums.create(data: {
            "rank"      => album["rank"],
            "name"      => album["name"],
            "artist"    => album["artist"]["name"],
            "image_url" => album["image"][3]["content"]
          })
        end
      end
    end
  end
end