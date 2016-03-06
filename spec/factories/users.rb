FactoryGirl.define do
  factory :user do
    name {Faker::name}
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
  end
end
