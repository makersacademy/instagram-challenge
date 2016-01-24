FactoryGirl.define do
  factory :user do
    email { "test@example.com" }
    password 'testing1'
    password_confirmation 'testing1'
  end
end
