FactoryGirl.define do
  factory :user do
    email                 'factory_user@test.com'
    password              '12344321'
    password_confirmation '12344321'
  end
end
