FactoryBot.define do
  factory :post do
    username { Faker::Internet.username }
    description { Faker::Movies::StarWars.quote }
    image { "https://placedog.net/images?id=#{rand(1..100)}" }
    user_id { 1 }
  end
end