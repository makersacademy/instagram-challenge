FactoryGirl.define do
  factory :picture do
    caption 'much doge'
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/DOGE.jpg', 'image/jpg')
  end
end
