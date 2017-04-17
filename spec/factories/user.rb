FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password "password"
    password_confirmation "password"
  end
end
