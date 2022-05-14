FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "use_#{n}@example.com" }
    password { "password" }
  end
end
