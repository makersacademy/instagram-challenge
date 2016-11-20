FactoryGirl.define do
  factory :picture do
    caption "Test"
    user_id 1
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/pictures/picture.jpg', 'image/jpg')
  end
end
