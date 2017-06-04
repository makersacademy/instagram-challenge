FactoryGirl.define do
  sequence :email do |n|
    "example#{n}@example.com"
  end

  factory :user do
    first_name "Testy"
    last_name "McTestface"
    email
    password "password"
    password_confirmation "password"
  end

end
