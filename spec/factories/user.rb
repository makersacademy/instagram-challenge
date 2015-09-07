require 'factory_girl'
FactoryGirl.define do
  factory :user do
    email 'owen@test.com'
    password '12345678'
    password_confirmation '12345678'
    user_name 'Owen'
  end
end
