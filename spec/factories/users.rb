FactoryGirl.define do
  
  factory :user do
    email 'test@test.com'
    password 'password123'
  end

  factory :user2, class: User do
    email 'test2@test.com'
    password 'password321'
  end
end
