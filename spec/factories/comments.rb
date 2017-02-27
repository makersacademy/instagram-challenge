include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :comment do
    thoughts { Faker::Hipster.sentence }
    photo
    user
  end
end
