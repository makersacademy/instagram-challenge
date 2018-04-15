FactoryBot.define do
  factory :post do
    caption "nofilter"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/nottingham.jpg', 'image/jpg')
  end
end
