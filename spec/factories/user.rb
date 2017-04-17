FactoryGirl.define do
  factory :user do
    email 'foo@bar.com'
    username 'foobar'
    password '12345678'
    password_confirmation '12345678'
  end
end
