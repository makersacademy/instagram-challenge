FactoryGirl.define do
  factory :picture do
    title Faker::Book.title
    description Faker::Lorem.sentence
    association :user
  end
end
