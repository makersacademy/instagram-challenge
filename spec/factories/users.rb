FactoryBot.define do
  factory :user do
    first_name { 'Testy' }
    last_name { 'Testerson' }
    username { 'testy2' }
    email { 'testy2@test.com' }
    password { 'Password' }
  end
end
