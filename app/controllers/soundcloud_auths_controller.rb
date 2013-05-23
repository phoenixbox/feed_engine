class SoundcloudAuthsController < ApplicationController

  def create
    user = current_user
    client = connect_to_soundcloud
    code = params[:code]
    access_token = client.exchange_token(:code  => code)["access_token"]
    soundcloud_auth = user.soundcloud_auths.new(token: access_token)

    if soundcloud_auth.save
      Resque.enqueue(SoundcloudFavorites, {:user_id => user.id})
      redirect_to myaccount_path, message: "Successfully connected to Soundcloud"
    else
      redirect_to myaccount_path, error: "Sorry, unable to connect to Soundcloud"
    end
  end

  def approve
    client = connect_to_soundcloud
    redirect_to client.authorize_url(:scope => "non-expiring")
  end

private

  def connect_to_soundcloud
    Soundcloud.new({
      :client_id      => ENV["SOUNDCLOUD_CONSUMER_KEY"],
      :client_secret  => ENV["SOUNDCLOUD_CONSUMER_SECRET"],
      :redirect_uri   => "http://www.streamrolled.com/connect/soundcloud/callback"
    })
  end
end
