FactoryBot.define do
  factory :post do
    caption "test caption"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/greatview.jpeg', 'image/jpg')
  end
end
