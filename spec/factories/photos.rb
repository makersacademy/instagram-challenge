include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :photo do
    status { Faker::Hipster.sentence }
    image { fixture_file_upload "./spec/images/kitten.jpg", "image/jpg" }
    user
  end
end
