class UsersController < ApplicationController

  def show
    @user = User.find_by_subdomain!(request.subdomain)
    @feeds = @user.feed_items
    @tl_text = TlText.new
  end

end
