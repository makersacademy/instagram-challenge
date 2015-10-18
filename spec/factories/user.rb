FactoryGirl.define do

  factory :user do
    email 'test@example.com'
    password 'testtest'
    password_confirmation 'testtest'
  end

end
