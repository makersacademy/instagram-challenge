FactoryGirl.define do
  factory :user do
    email    'user@example.com'
    password '123456789'
    password_confirmation '123456789'
  end

  factory :first_user, class: User do
    email    'first@example.com'
    password '123456789'
    password_confirmation '123456789'
  end

  factory :second_user, class: User do
    email    'second@example.com'
    password '123456789'
    password_confirmation '123456789'
  end
end
