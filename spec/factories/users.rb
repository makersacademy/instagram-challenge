FactoryBot.define do
  factory :user do
    email 'test@test.com'
    user_name 'testuser_1'
    password 'password'
    password_confirmation 'password'
  end
end
