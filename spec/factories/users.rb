FactoryBot.define do
  factory :user do
    email { 'bobross@mail.com' }
    username { 'bobross' }
    full_name { 'Bob Ross' }
    password { 'password123' }
    id { 1 }
  end
end
