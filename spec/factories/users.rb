FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name
    email Faker::Internet.email
    password Faker::Internet.password(8)
    password_confirmation { "#{password}" }
  end
end
