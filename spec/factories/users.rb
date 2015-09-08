FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end

  sequence :username do |n|
    "user#{n}"
  end

  factory :user do
    email
    username
    password 'test1234'

    factory :user_with_fixed_username do
      username 'user'
    end
  end
end

# FactoryGirl.define do
#   factory :comment do
#     contents "Nice"
#     association :photo, strategy: :build
#     association :user, strategy: :build
#     after(:create) { |comment| comment.user_id = 1 }
#   end
#
#   factory :photo do
#     description 'Testing'
#     image File.new("#{Rails.root}/spec/support/fixtures/images/testing.png")
#     association :user, strategy: :build
#   end
#
#   factory :user do
#     email 'test@test.com'
#     password 'test1234'
#   end
# end
