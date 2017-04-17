FactoryGirl.define do
  factory :user do
    email 'testing@testing.com'
    password 'testtest'
    password_confirmation 'testtest'
  end
end
