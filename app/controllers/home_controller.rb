class HomeController < ApplicationController

  def show
    @global_feed = FeedItem.all.shuffle
  end

end
