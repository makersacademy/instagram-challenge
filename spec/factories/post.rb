FactoryGirl.define do
  factory :post do
    caption 'little monkey'
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/monkey.jpg', 'image/jpg')
  end
end
