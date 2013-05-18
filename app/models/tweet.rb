class Tweet < FeedItem

  def self.update_tweets
    User.all.each do |user|
      user.tuneline_mentions.each do |mention|
        user.tweets.create_from_form({"text" => mention.text, "twitter_id" => mention.id})
      end
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
