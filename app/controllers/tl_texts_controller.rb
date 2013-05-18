class TlTextsController < ApplicationController

  def create
    @tl_text = current_user.tl_texts.create_from_form(params[:tl_text])
    if @tl_text.save
      redirect_to :back, notice: "Successfully added item to feed"
    else
      redirect_to :back, notice: "Your message must be between 1-512 characters"
    end
  end
end
