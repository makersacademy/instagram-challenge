FactoryGirl.define do  
  factory :post do
    caption "nofilter"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/sunset.jpg', 'image/jpg')
    user
  end
end
