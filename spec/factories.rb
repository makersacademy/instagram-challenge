FactoryBot.define do

  factory :user do
    name { 'Ruby Rails' }
    email { 'test@example.com' }
    password { '123456789' }
  end

  factory :picture do
    image { 'cat.jpeg' }
    user { create(:user) }
  end

  factory :comment do
    text { 'this is a comment' }
    picture { create(:picture) }
    user { create(:user) }
  end

end
