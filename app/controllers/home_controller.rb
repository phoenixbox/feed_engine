class HomeController < ApplicationController

  def show
    @global_feed = FeedItem.limit(50).shuffle
  end

end
