FactoryBot.define do
  factory :comment do
    body { "MyText" }
    user :factory => :user
    post :factory => :post
  end

  sequence :email do |n|
    "person#{n}@example.com"
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
    email { generate :email }
    password { "password" }
  end

  factory :like do
    user :factory => :user
    post :factory => :post
  end

end
