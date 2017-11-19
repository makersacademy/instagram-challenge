FactoryBot.define do
  factory :post do
    text 'Test text'
    user_id 1
    image Rack::Test::UploadedFile.new(
        Rails.root + 'spec/files/images/test_img_1.jpg',
        'image/jpg')
  end
end
