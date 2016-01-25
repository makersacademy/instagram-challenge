FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password 'testing1'
    password_confirmation 'testing1'
  end
end
