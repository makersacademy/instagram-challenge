FactoryGirl.define do
  factory :post do
    title "nofilter"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/IMG_1820a-wb.jpg', 'image/jpg')
  end
end
