class TlLink < FeedItem


  def self.create_from_form(input)
    create! do |tl_link|
      tl_link.data["content"] = input["content"]
      # tl_link.data["link"] = input["link"]
    end
  end

  def valid_attrs
    %w[content link]
  end
end
