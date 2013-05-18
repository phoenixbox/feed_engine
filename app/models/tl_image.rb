class TlImage < FeedItem
  validates_presence_of :content, :message => "Where is your link?"
  validates_length_of :content, :maximum => 240


  def self.create_from_form(input)
    create! do |tl_image|
      tl_image.data["content"] = input["content"]
    end
  end

  def valid_attrs
    %w[content]
  end
end
