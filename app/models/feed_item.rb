class FeedItem < ActiveRecord::Base

  serialize :data, ActiveRecord::Coders::Hstore
  attr_accessible :data, :feed_item_points_count, :user_id
  belongs_to :user

  VALID_DATA_ATTRIBUTES = %w[type tl_text tl_link tl_image]

  def self.create_from_tuneline(input, user)
    create! do |item|
      item.data["type"] = self.type(input)
      item.user_id = user.id
      input.each do |key, value|
        item.data[key] = value
      end
    end
  end

  def self.type(input)
    input.each do |key, value|
      return key if VALID_DATA_ATTRIBUTES.find(key)
    end
  end


  VALID_DATA_ATTRIBUTES.each do |key|
    attr_accessible key
    scope "has_#{key}", lambda { |value| where("data @> hstore(?, ?)", key, value) }

    define_method(key) do
      data && data[key]
    end

    define_method("#{key}=") do |value|
      self.data["#{key}"] = value
    end
  end
end
