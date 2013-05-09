class Tweet < ActiveRecord::Base
  attr_accessible :content, :image_url, :tweet_id
end
