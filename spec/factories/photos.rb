include ActionDispatch::TestProcess

FactoryGirl.define do
   factory :photo do
    caption { Faker::Hipster.sentence }
    image { fixture_file_upload "./spec/images/coffee.jpg", "image/jpg" }
    user
   end
 end
