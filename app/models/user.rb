class User < ActiveRecord::Base

  has_many :feed_items
  has_many :tl_texts
  has_many :authorizations

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    name = auth["info"]["nickname"]
    @user = create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = name
      user.subdomain = name.downcase
    end
    Authorization.create_from_omniauth(auth["credentials"]["token"], auth["credentials"]["secret"], @user.id, "twitter")
    @user
  end
end
