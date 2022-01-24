FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    email { generate :email }
    password { 'just4pa55w0rd' }
    username { 'username' }
  end

  factory :post do
    association :user
    body { 'testy test' }
  end
end