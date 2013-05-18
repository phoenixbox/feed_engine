class TwitterAuth < Authorization
  def self.connect(user)
    auth = user.twitter_authorization
    Twitter::Client.new(oauth_token: auth.token, oauth_token_secret: auth.secret)
  end
end
