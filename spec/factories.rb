FactoryGirl.define do
  factory :picture do

  end

  factory :user do
    sequence(:email, 1) { |n| "email#{n}@example.com" }
    sequence(:provider_name, 1) { |n| "Provider#{n}" }
    password 'password'
    password_confirmation 'password'
  end
end
