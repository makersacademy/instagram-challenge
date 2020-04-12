FactoryBot.define do
  factory :picture do
    image_url { "http://image.com" }
    user { create(:user) }
  end

  factory :user do
    id { 1 }
    name { 'Ruby Rails' }
    email { 'test@example.com' }
    password { '123456789' }
  end
end
