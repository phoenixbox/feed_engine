class HomeController < ApplicationController

  def show
    # how to get the data without going to the route? - ex the UX
    @global_feed = FeedItem.all
  end

end
