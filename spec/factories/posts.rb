FactoryBot.define do
  factory :post do
    image { Faker::LoremFlickr.image }
    user_id { Faker::Number.within(range: 1..10) }
    description { Faker::Lorem.sentence(word_count: 13)  }
  end
end