FactoryGirl.define do
  factory :user do
    email 'joeb@test.com'
    password 'password'
    password_confirmation 'password'
  end
  
  factory :user2, class: User do
    email 'wendy@test.com'
    password 'password'
    password_confirmation 'password'
  end
end
