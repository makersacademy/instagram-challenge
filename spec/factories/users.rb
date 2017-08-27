FactoryGirl.define do
  factory :user do
      sequence :email do |n|
        "person#{n}@test.com"
      end
      sequence :user_name do |n|
        "bob#{n}"
      end
      password "testing"
  end
end
