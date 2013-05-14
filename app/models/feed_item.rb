class FeedItem < ActiveRecord::Base
  attr_accessible :data, :feed_item_points_count, :user_id

  %w[tl_text tl_image tl_link].each do |key|
    attr_accessible key
    scope "has_#{key}", lambda { |value| where("data @> hstore(?, ?)", key, value) }

    define_method(key) do
      data && data[key]
    end

    define_method("#{key}=") do |value|
      self.data = (data || {}).merge(key => value)
    end
  end
end
