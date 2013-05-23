class HomeController < ApplicationController

  def show
    global_random = FeedItem.all.shuffle
    @global_feed = global_random.take(50)
  end

end
