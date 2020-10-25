FactoryBot.define do
  factory :user do
    username { "Tester"}
    email {"test@user.com"}
    password {"secret"}
    password_confirmation {"secret"}
    # Add additional fields as required via your User model
  end

  sequence :id do |n|
    "#{n}"
  end
  
end