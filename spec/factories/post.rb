FactoryGirl.define do
  factory :post do
    caption "nofilter"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/hipster.jpg', 'image/jpg')
    id 1
  end
end
