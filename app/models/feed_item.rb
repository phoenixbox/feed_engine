class FeedItem < ActiveRecord::Base
  attr_accessible :data, :feed_item_points_count, :user_id
end
