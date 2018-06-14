FactoryBot.define do
  factory :user do
    username "Andrew"
    email "test@test.com"
    password "password1"
    password_confirmation "password1"
    id 1
  end
end
