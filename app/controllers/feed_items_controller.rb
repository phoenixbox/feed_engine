class FeedItemsController < ApplicationController

  def create
    fail
    feed_item = FeedItem.new(params["feed_item"])
  end
end
