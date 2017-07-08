FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :username do |n|
    "user#{n}"
  end

  factory :user do
    username
    email
    password "password"
  end
end
