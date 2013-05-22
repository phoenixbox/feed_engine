class TlLinksController < ApplicationController

  def create
    @tl_link = current_user.tl_links.create_from_form(params[:tl_link])
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
