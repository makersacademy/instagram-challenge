require 'factory_girl'
FactoryGirl.define do
  factory :user do
    email 'owen@gmail.com'
    user_name 'Owen'
    password 'testtest'
    id 1
  end
end
