FactoryGirl.define do

  sequence :email do |number|
    "test#{number}@test.com"
  end

  factory :user do
    email { generate(:email) }
    password 'test1234'
  end
end
