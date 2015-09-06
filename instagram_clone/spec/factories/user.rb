require 'factory_girl_rails'

FactoryGirl.define do

  factory :user do
    email "a@alphabet.com"
    password "12345678"
    password_confirmation "12345678"
  end

end