FactoryBot.define do
  factory :comment do
    id 1
    body "MyText"
    post
    user
  end
end
