# include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :user do
    trait :first do
      username 'bettydraper'
      email 'betty@drapers.com'
      password 'bettylovesdon'
      password_confirmation 'bettylovesdon'
    end

    trait :second do
      username 'dondraper'
      email 'don@drapers.com'
      password 'donloveswhisky'
      password_confirmation 'donloveswhisky'
    end
  end
end
