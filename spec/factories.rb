FactoryBot.define do
  factory :user do
    
  end
  factory :post do
    caption "test caption"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/greatview.jpeg', 'image/jpg')
  end
end
