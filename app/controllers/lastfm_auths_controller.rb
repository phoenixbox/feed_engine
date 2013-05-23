class LastfmAuthsController < ApplicationController

  def create
    user = current_user
    lfm = Lastfm.new(ENV["LASTFM_CONSUMER_KEY"], ENV["LASTFM_CONSUMER_SECRET"])
    lfm.session = lfm.auth.get_session(:token => params["token"])['key']
    lastfm_auth = user.lastfm_auths.new(token: lfm.session)
    if lastfm_auth.save
      Resque.enqueue(LastfmTopTracks, {:user_id => user.id})
      Resque.enqueue(LastfmTopAlbums, {:user_id => user.id})
      Resque.enqueue(LastfmTopArtists, {:user_id => user.id})
      redirect_to myaccount_path, message: "Successfully connected to LastFM."
    else
      redirect_to myaccount_path, error: "Unable to connect to LastFM."
    end
  end
end
