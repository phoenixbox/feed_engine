class TlImagesController < ApplicationController

  def create
    @tl_image = current_user.tl_images.create(params[:tl_image])
    respond_to do |format|
      format.html { redirect_to :back  }
      format.js
    end
  end
end
