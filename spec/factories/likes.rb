FactoryGirl.define do
  factory :like do
    association :user
    association :picture
  end
end
