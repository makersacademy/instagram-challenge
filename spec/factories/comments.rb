FactoryGirl.define do
  factory :comment do
    comment { Faker::Hipster.sentence }
  end
end
