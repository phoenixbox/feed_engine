class TlImage < FeedItem
  validates_length_of :content, :maximum => 256
  validates_presence_of :image

  def self.create_from_form(input)
    create! do |tl_image|
      tl_image.data["content"] = input["content"]
      tl_image.data["image"] = input["image"]
    end
  end

  def valid_attrs
    %w[content image]
  end
end
