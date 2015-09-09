FactoryGirl.define do
  factory :user do
    email "test@test.com"
    username "test"
    password "12345678"

    factory :user2 do
      email "test2@test.com"
      username "test2"
    end
  end
end