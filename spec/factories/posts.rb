FactoryGirl.define do
  sequence :user_id do |n|
    n
  end
 factory :post do
    image File.open('spec/fixtures/test-image.jpg')
    color_filter "None"
    caption "Stunning!"
    user_id
  end
end
