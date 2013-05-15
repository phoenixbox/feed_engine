class Authorization < ActiveRecord::Base
  belongs_to :user
  attr_accessible :raw_info, :token, :secret, :type

  def self.create_from_omniauth(token, secret, user_id, service)
    create! do |auth|
      auth.service_provider = service
      auth.token = token
      auth.secret = secret
      auth.user_id = user_id
    end
  end
end
