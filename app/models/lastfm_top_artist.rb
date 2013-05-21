class LastfmTopArtist < FeedItem

  def self.update_all
    User.all.each do |user|
      unless user.lastfm_auths.empty?
        update_top_artists_for_user(user.id)
      end
    end
  end

  def valid_attrs
    %[name rank playcount image_url]
  end

  def self.update_top_artists_for_user(user_id)
    user = User.find(user_id)
    unless user.lastfm_auths.empty?
      lastfm = Lastfm.new(ENV["LASTFM_CONSUMER_KEY"], ENV["LASTFM_CONSUMER_SECRET"])
      # dont want this to fire until I have authorised the token
      token = user.lastfm_auths.first.token
      lastfm.session = token

      lastfm_username = lastfm.user.get_info["name"]

      top_artists = lastfm.user.get_top_artists(lastfm_username).first(9)

      top_artists.each do |artist|
        if artist["image"]
          user.lastfm_top_artists.create(data: {
            "name"    => artist["name"],
            "rank"      => artist["rank"],
            "playcount" => artist["playcount"],
            "image_url" => artist["image"][3]["content"]
          })
        end
      end
    end
  end
end