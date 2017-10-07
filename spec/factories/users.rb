FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@test.com"
    end
    sequence :username do |n|
      "name#{n}"
    end
    password "testing"

  end
end
