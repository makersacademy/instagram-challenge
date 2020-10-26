require 'faker'

FactoryBot.define do
  factory :user do 
    username { Faker::Name.username }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(max_length: 10) }
  end
end