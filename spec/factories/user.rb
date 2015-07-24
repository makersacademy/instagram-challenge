FactoryGirl.define do

  sequence :email do |n|
    "example@mail.com#{n}"
  end

  factory :user do
    email { generate(:email) }
    password 'secret1234'
  end

  factory :confirmed_user, :parent => :user do
    after(:create) { |user| user.confirm! }
  end

end
