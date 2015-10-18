FactoryGirl.define do
  factory :user do
    email    'user@example.com'
    userName 'Test User'
    password '123456789'
    password_confirmation '123456789'
  end

  factory :user1, class: User do
    email    'first@example.com'
    userName 'Test User1'
    password '123456789'
    password_confirmation '123456789'
  end

  factory :user2, class: User do
    email    'second@example.com'
    userName 'Test User2'
    password '123456789'
    password_confirmation '123456789'
  end
end
