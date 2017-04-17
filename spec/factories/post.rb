FactoryGirl.define do
  factory :post do
    caption 'little monkey'
    id 1
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/monkey.jpg', 'image/jpg')
  end
end
