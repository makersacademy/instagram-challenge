require 'factory_girl_rails'

FactoryGirl.define do

  factory :user do
    email 'katya@test.com'
    username 'katya'
    password '12345678'
    password_confirmation '12345678'
  end

  factory :user_2, parent: :user do
    email 'hello@test.com'
    username 'jeremy'
    password '12345678'
    password_confirmation '12345678'
  end

end
