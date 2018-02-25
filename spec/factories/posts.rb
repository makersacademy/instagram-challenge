FactoryBot.define do
  factory :post do
    description "ImageDescription"
    image Rack::Test::UploadedFile.new(Rails.root +
    'spec/files/images/picture.jpg', 'image/jpg')
  end
end
