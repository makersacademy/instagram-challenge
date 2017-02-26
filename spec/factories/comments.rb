include ActionDispatch::TestProcess

FactoryGirl.define do
   factory :comment do
    thoughts { Faker::Hipster.sentence }
    association :photo_id
   end
 end
