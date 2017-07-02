FactoryGirl.define do
  factory :user do
    display_name "Test_User"
    email "test@email.com"
    password_digest "password"
  end
end
