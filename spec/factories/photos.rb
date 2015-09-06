FactoryGirl.define do
  factory :photo do
    title "test"
    image  Rack::Test::UploadedFile.new(Rails.root + 'spec/assets_specs/photos/test_photo1.jpg', 'image/jpg')
  end

end
