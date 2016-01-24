FactoryGirl.define do
  factory :user do
    email 'joeb@test.com'
    password 'password'
    password_confirmation 'password'
  end
end
