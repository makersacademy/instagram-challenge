FactoryGirl.define do
  factory :picture do

  end

  factory :user do
    sequence(:email, 1) { |n| "email#{n}@example.com" }
    sequence(:provider_name, 1) { |n| "Provider#{n}" }
    password 'password1234'
    password_confirmation { "#{password}" }
  end

  factory :invalid_user, class: User do
    email "email"
    provider_name ""
    password "p"
    password_confirmation ""
  end

  factory :listing_with_user do
    day "Monday"
    start_time { rand(420..1320) }
    association :user
  end

  factory :listing_without_user do
    day "Monday"
    start_time { rand(420..1320) }
    association :user
  end
end
