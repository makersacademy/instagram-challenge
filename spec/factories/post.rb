FactoryGirl.define do
  factory :photo do
    title "testimage"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/testimage.jpg', 'image/jpg')
  end
end
