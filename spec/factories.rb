# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { "MyText" }
    user factory: :user
    post factory: :post
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :username do |n|
    "Joe#{n}"
  end

  factory :post do
    association :user
    caption { 'Test post' }
    image { FilesTestHelper.png }
  end

  factory :user do
    first_name { "Joe" }
    last_name { "Bloggs" }
    username { generate :username }
    email { generate :email }
    password { "password" }
  end

  factory :like do
    user factory: :user
    post factory: :post
  end
end
