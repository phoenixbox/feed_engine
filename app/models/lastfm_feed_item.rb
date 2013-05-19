class LastfmTopTrack < FeedItem

  def self.update_all
    User.all.each do |user|
      save_new_tracks_for_user(user.id)
    end
  end

  def valid_attrs
    %[artist name rank playcount image_url]
  end

  def self.update_top_tracks_for_user(user_id)
    user = User.find(user_id)

    lastfm = Lastfm.new(ENV["LASTFM_CONSUMER_KEY"], ENV["LASTFM_CONSUMER_SECRET"])
    token = user.lastfm_auths.first.token
    lastfm.session = token

    lastfm_username = lastfm.user.get_info["name"]

    top_tracks = lastfm.user.get_top_tracks(lastfm_username)

    top_tracks.each do |track|
      create(data: {
        "artist"    => track["artist"]["name"],
        "name"      => track["name"],
        "rank"      => track["rank"],
        "playcount" => track["playcount"],
        "image_url" => track["image"][3]
      })
    end
  end

end
