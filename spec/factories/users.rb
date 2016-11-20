FactoryGirl.define do
  factory :user do |u|
  u.sequence(:email) { |n| "mike#{n}@awesome.com"}
  u.password "password123"
end
end
