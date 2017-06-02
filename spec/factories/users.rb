FactoryGirl.define do

  sequence :email do |n|
    "example#{n}@example.com"
  end

  sequence :username do |n|
    "username#{n}"
  end

  factory :user do
    email
    username
    password "password"
    password_confirmation "password"
  end

end
