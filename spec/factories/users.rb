FactoryGirl.define do
  sequence :username do |n|
    "person#{n}"
  end
  sequence :email do |n|
    "person#{n}@example.com"
  end
  factory :user do
    username
    email
    password "somethingsecure"
    avatar File.open('spec/fixtures/avatar.jpg')
  end
end
