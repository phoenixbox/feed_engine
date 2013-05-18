class TlText < FeedItem
  validates_presence_of :content, :message => "Your submission can't be empty"
  validates_length_of :content, :maximum => 512

  def self.create_from_form(input)
    create do |tl_text|
      tl_text.data["content"] = input["content"]
    end
  end

  def valid_attrs
    %w[content]
  end
end
