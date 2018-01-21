FactoryBot.define do
  factory :comment do
    user nil
    post nil
    content "MyText"
  end
  factory :user do
    
  end
  factory :post do
    caption "test caption"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/greatview.jpeg', 'image/jpg')
  end
end
