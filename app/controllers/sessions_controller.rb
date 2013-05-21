class SessionsController < ApplicationController

  def create
    #auth = env['omniauth.auth']
    user = User.from_omniauth(env["omniauth.auth"])
    #if user.persisted?
    #  #create authorization
    #  user.authorizations.create(auth)
    #end
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed In!"
  end

  def destroy
    session[:user_id] = nil
    # need to redirect to the root of the app not the subdomain
    redirect_to 'http://lvh.me:3000', notice: "Signed Out!"
  end

end
