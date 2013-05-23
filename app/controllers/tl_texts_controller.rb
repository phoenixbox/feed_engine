class TlTextsController < ApplicationController

  def create
    @tl_text = current_user.tl_texts.create_from_form(params[:tl_text])
      respond_to do |format|
        if @tl_text.save
          format.html { redirect_to :back }
          format.js 
        else
          redirect_to :back  
        end
      end
  end
end

