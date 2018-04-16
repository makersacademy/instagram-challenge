FactoryBot.define do # creates fake user
  factory :user do
    email { FFaker::Internet.email }
    password { Devise.friendly_token.first(8) }
  end
end
