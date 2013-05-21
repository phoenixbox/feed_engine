class UsersController < ApplicationController

  def show
    @user = User.find_by_subdomain!(request.subdomain)
    @feeds = @user.feed_items.order('created_at DESC')
     # && LastfmTopTrack.update_top_tracks_for_user(@user.id)
    # when should it be fired - when itegration is called
    @tl_text = TlText.new
    @tl_link = TlLink.new
    @tl_image = TlImage.new
  end

end
