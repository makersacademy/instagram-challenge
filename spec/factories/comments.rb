FactoryGirl.define do
  sequence :content do
    Faker::Lorem.sentence
  end

  factory :comment do
    content { generate :content }
    association :user
    association :picture
  end
end
