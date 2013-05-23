class HomeController < ApplicationController

  def show
    @global_feed = FeedItem.limit(50)
  end

end
