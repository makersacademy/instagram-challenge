FactoryGirl.define do

  factory :user do
    email 'afoo@fakemail.com'
    username 'fakeuser'
    password 'pazzword123'
    password_confirmation 'pazzword123'
  end
end