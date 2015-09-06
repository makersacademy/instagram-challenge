FactoryGirl.define do
  factory :user do
    email 'test_user@test.com'
    password 'testtest'
    password_confirmation 'testtest'
  end

end
