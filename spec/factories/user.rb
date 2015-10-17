FactoryGirl.define do
  factory :user do
    email 'user1@example.com'
    password 'password'
    password_confirmation 'password'
  end
end
