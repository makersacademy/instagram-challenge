FactoryGirl.define do
  factory :post do
    caption "google logo"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/googlelogo.png', 'image/png')
  end
end