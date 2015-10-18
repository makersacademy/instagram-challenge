FactoryGirl.define do
  factory :user do
    email 'test@email.com'
    password 'password'
    password_confirmation 'password'
  end
end
