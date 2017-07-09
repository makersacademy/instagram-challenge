FactoryGirl.define do
  factory :comment do
    message "MyText"
    post
    user
  end
end
