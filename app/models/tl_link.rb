class TlLink < FeedItem
  validates_presence_of :content, :message => "Your submission can't be empty"
  validates_presence_of :link, :message => "Where is your link?"
  validates_length_of :content, :maximum => 240


  def self.create_from_form(input)
    create! do |tl_link|
      tl_link.data["content"] = input["content"]
      tl_link.data["link"] = input["link"]
    end
  end

  def valid_attrs
    %w[content link]
  end
end
