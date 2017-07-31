FactoryGirl.define do
  factory :user do
    email 'testmail@gmail.com'
    user_name 'Alessandro'
    password 'password'
    sequence(:id) { |id| id }  
  end
end
