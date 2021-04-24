FactoryBot.define do
  factory :user do
    forename { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    username { Faker::Internet.username }
    password { Faker::Internet.password }
  end
end