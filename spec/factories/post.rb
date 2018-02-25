FactoryBot.define do
  factory :post do
    id 1
    comment "My Fave Cat"
    avatar Rack::Test::UploadedFile.new(Rails.root + 'spec/images/cat.jpg', 'image/jpg')
    user
  end

  factory :invalid_post do
    comment "Hello"
    avatar nil
    user
  end
end
