FactoryGirl.define do
 factory :user do
    provider 'twitter'
    uid '1194642836'
    name 'sdjrog'
    subdomain 'sdjrog'

    factory :invalid_user do
      name nil
    end
  end
end