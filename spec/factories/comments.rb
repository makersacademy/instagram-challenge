include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :comment do
    content { Faker::Hipster.sentence }
    association :photo
  end
end
