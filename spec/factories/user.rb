FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password "12345678"

    factory :user2 do
      email "test2@test.com"
    end
   end
end