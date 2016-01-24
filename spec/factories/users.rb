FactoryGirl.define do
  sequence :username do
    Faker::Internet.user_name
  end

  sequence :email do
    Faker::Internet.email
  end
  
  sequence :password do
    Faker::Internet.password(8)
  end

  factory :user do
    username { generate :username }
    email { generate :email }
    password { generate :password }
    password_confirmation { "#{password}" }
  end
end
