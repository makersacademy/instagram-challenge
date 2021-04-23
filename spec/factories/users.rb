FactoryBot.define do
  factory :user do
    forename { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    profile_picture  { Faker::LoremFlickr.image }
  end
end
