class Tweet < FeedItem

  def self.update_tweets
    User.all.each do |user|
      user.create_from_mentions
    end
  end

  def valid_attrs
    %[text twitter_id]
  end

end
