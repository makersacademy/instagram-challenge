FactoryGirl.define do
  factory :user do
    email 'test@email.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :second_user, class: User do
    email 'test@test.com'
    password '12345678'
    password_confirmation '12345678'
  end
end
