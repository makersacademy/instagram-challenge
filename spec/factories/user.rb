FactoryGirl.define do

  sequence :email do |n|
    "example#{n}@mail.com"
  end

  sequence :username do |n|
    "test_user#{n}"
  end

  factory :user do
    username { generate(:username) }
    email { generate(:email) }
    password 'secret1234'
  end

  factory :confirmed_user, :parent => :user do
    after(:create) { |user| user.confirm! }
  end

end
