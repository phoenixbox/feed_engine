class LastfmAuthsController < ApplicationController

  def create
    user = current_user
    lfm = Lastfm.new(ENV["LASTFM_CONSUMER_KEY"], ENV["LASTFM_CONSUMER_SECRET"])
    lfm.session = lfm.auth.get_session(:token => params["token"])['key']
    lastfm_auth = user.lastfm_auths.new(token: lfm.session)
    if lastfm_auth.save
      LastfmTopTrack.update_top_tracks_for_user(user.id)
      LastfmTopAlbum.update_top_albums_for_user(user.id)
      LastfmTopArtist.update_top_artists_for_user(user.id)
      redirect_to root_url(subdomain: current_user.subdomain)
    else
      redirect_to root_url(subdomain: current_user.subdomain), :message => "Sorry, unable to connect"
    end
  end
end