FactoryGirl.define do  
  factory :post do
    caption "phat burger"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/burger.jpg', 'image/jpg')
  end
end  