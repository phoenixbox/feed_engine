class SessionsController < ApplicationController

  def create
    fail
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
    redirect_to root_url, notice: "Signed Out!"
  end

end
