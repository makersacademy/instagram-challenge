FactoryGirl.define do
  factory :user do
    sequence :email do |n|
    "person#{n}@example.com"
    end
    password '123456'

    sequence :user_name do |d|
    "testusername#{d}"
    end
  end
end
