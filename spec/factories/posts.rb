FactoryBot.define do
  factory :post do
    caption "MyString"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/Brainslug.jpg', 'image/jpg')
  end
end
