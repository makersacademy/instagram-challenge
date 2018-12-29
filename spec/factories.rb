FactoryBot.define do
  factory :post do
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
