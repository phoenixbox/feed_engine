class TlImage < FeedItem


  def self.create_from_form(input)
    create! do |tl_image|
      tl_image.data["content"] = input["content"]
    end
  end

  def valid_attrs
    %w[content]
  end
end
