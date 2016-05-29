FactoryGirl.define do
  factory :post do
    title "A Picture!"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/poo.jpg', 'image/jpg')
    caption "basic image post"
  end
end