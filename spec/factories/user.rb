FactoryGirl.define do
  factory :user do
    email 'test2@example.com'
    password 'secret1234'
    password_confirmation 'secret1234'
  end

  factory :usertwo, class: User do
    email 'foo@bar.com'
    password 'secret1234'
    password_confirmation 'secret1234'
  end
end
