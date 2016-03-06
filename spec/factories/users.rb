FactoryGirl.define do
  factory :user do
    Email 'test@example.com'
    Password 'testtest'
    Password confirmation 'testtest'
  end
end
