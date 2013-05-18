class Tweet < FeedItem

  def self.update_tweets
    User.all.each do |user|
      user.create_from_mentions
    end
  end

  def self.create_from_form(input)
    create do |tweet|
      tweet.data["text"] = input["text"]
      tweet.data["twitter_id"] = input["twitter_id"]
    end
  end

  def valid_attrs
    %[text twitter_id]
  end

end
