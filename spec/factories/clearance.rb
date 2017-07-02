FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email "hello@hello.com"
    password "password"
  end
end
