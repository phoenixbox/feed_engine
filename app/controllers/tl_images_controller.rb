class TlImagesController < ApplicationController

  def create
    @tl_image = current_user.tl_images.create_from_form(params[:tl_image])
    #@tl_text = current_user.tl_texts.create(params[:feed_item])
    if @tl_image.save
      redirect_to :back, notice: "Successfully added item to feed"
    else
      redirect_to :back, notice: "Sorry pal"
    end
  end
end
