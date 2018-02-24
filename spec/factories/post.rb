FactoryBot.define do
  factory :post do
    comment "My Fave Cat"
    avatar Rack::Test::UploadedFile.new(Rails.root + 'spec/images/cat.jpg', 'image/jpg')
  end
end
