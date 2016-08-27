FactoryGirl.define do
  factory :post do
    caption "nice music noises"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/maccabees.jpg', 'image/jpg')
  end
end
