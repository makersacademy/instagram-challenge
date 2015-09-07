FactoryGirl.define do
  factory :comment do
    thoughts 'nice'
    post
    user
  end
end
