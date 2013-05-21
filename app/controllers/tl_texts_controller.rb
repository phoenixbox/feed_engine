class TlTextsController < ApplicationController

  def create
    @tl_text = current_user.tl_texts.create_from_form(params[:tl_text])
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
