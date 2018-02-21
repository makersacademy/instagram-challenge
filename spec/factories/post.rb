FactoryBot.define do
  factory :post do
    description 'a description'
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/images/8.jpeg', 'image/jpeg')
  end
end
