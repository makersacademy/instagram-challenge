FactoryBot.define do
  factory :user do
    name { 'Ruby Rails' }
    email { 'test@example.com' }
    password { '123456789' }
  end
end
