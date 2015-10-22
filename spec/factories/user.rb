FactoryGirl.define do
  factory :user do
    username              'test_user'
    email                 'factory_user@test.com'
    password              '12344321'
    password_confirmation '12344321'
  end
end
