FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password 'password123'
    password_confirmation 'password123'
  end
end
