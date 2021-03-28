FactoryBot.define do
  factory :user do
    first_name { 'Testy' }
    last_name { 'Testerson' }
    username { 'testy1' }
    email { 'testy@test.com' }
    password { 'Password' }
  end
end
