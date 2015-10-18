FactoryGirl.define do
  factory :user do
    email    'user@example.com'
    userName 'Test User'
    password '123456789'
    password_confirmation '123456789'
  end

  factory :first_user, class: User do
    email    'first@example.com'
    userName 'Test User1'
    password '123456789'
    password_confirmation '123456789'
  end

  factory :second_user, class: User do
    email    'second@example.com'
    userName 'Test User2'
    password '123456789'
    password_confirmation '123456789'
  end
end
