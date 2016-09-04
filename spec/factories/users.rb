include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user do
    email "me@gmail.com"
    password "instagram"
  end
end
