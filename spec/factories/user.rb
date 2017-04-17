require 'factory_girl'

FactoryGirl.define do
  factory :user do
    username 'testuser'
    email 'testuser@example.com'
    password 'testing123'
    password_confirmation 'testing123'
  end
end
