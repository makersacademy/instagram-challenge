FactoryGirl.define do

  factory :user do
    email "test2@test.com"
    password '12345678'
    password_confirmation '12345678'

    factory :user_two do
      email 'test_user_new@test.com'
    end
  end
end
