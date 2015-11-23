FactoryGirl.define do

  factory :user do
    email 'user@example.com'
    password  'usertest'
    password_confirmation 'usertest'
  end
  
end
