FactoryGirl.define do
  sequence :user_id do |n|
    n
  end
 factory :post do
    image File.open('spec/fixtures/avatar.jpg')
    color_filter "Kelvin"
    caption "Itsa me, Mario!"
    user_id
  end
end
