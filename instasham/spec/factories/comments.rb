FactoryGirl.define do
  sequence :user do |n|
    n
  end
  sequence :post_id do |n|
    n
  end
 factory :comment do
    content "Hello!"
    user_id user
    post_id
  end
end
