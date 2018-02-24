FactoryBot.define do
  factory :post do
    id 1
    comment "My Fave Cat"
    avatar Rack::Test::UploadedFile.new(Rails.root + 'spec/images/cat.jpg', 'image/jpg')
  end
  factory :invalid_post do
    id 2
    comment "Hello"
    avatar nil
  end
end
