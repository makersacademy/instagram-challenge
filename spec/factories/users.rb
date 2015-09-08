FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password 'test1234'
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
