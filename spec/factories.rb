FactoryBot.define do
  factory :picture do
    image_url { "MyString" }
    user { nil }
  end

  factory :user do
    name { 'Ruby Rails' }
    email { 'test@example.com' }
    password { '123456789' }
  end
end
