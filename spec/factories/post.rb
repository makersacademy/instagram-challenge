FactoryGirl.define do
  factory :post do
    caption '#life'
    image_file_name 'testing.png'
    user
  end
end
