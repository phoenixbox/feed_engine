class TlTextsController < ApplicationController

  def create
    @feed_item = TlText.create_from_tuneline(params[:feed_item], current_user)
    if @feed_item.save
      redirect_to :back, notice: "Successfully added item to feed"
    else
      redirect_to :back, notice: "Sorry pal"
    end
  end
end
