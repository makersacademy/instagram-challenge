FactoryGirl.define do
  image_path = 'spec/files/images/hipster.jpg'
  factory :post do
    caption "nofilter"
    image Rack::Test::UploadedFile.new(Rails.root + image_path, 'image/jpg')
    id 1
  end
end
