class HomeController < ApplicationController

  def show
    @global_feed = FeedItem.all.shuffle[0..50]
  end

end
