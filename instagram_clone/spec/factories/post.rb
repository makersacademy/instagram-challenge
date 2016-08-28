FactoryGirl.define do
  factory :post do
    user
    caption "nofilter"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/coffee.jpg', 'image/jpg')
  end
end
