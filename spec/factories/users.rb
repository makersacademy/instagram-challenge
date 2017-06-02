FactoryGirl.define do

  sequence :email do |n|
    "example#{n+1}@example.com"
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
