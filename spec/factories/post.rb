FactoryGirl.define do
  factory :post do
    caption 'nofilter'
    image Rack::Test::UploadedFile.new(Rails.root + 'app/assets/images/coffee.jpg', 'image/jpg')
  end
end
