class TlLinksController < ApplicationController

  def create
    @tl_link = current_user.tl_links.create_from_form(params[:tl_link])
    #@tl_link = current_user.tl_links.create(params[:feed_item])
    if @tl_link.save
      redirect_to :back, notice: "Successfully added item to feed"
    else
      redirect_to :back, notice: "Sorry pal"
    end
  end
end
