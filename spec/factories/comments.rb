FactoryGirl.define do
  sequence :post_id do |n|
    n
  end
 factory :comment do
    content "Hello!"
    sequence(:user_id) { |n| n }
    post_id
  end
end
