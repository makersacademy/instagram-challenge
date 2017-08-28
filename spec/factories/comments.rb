FactoryGirl.define do
  factory :comment do
    user { create(:user) }
    post { create(:post) }
    content "This is a comment"
  end
end
