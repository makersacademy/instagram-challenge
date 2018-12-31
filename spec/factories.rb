FactoryBot.define do
  factory :like do
    post { nil }
    user { nil }
  end
  factory :post do
    association :user
    caption { 'Test post' }

    trait :with_image do
      image { FilesTestHelper.png }
    end
  end

  factory :user do
    first_name { "Joe" }
    last_name { "Bloggs" }
    username { "JoeyB" }
    email { "joe@gmail.com" }
    password { "password" }
  end
end
