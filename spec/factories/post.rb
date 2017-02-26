FactoryGirl.define do
  factory :post do
    caption "What I see on the beack"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/sample_02.jpg', 'image/jpg')
  end
end
