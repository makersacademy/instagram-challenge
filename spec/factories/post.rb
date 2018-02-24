FactoryBot.define do
  factory :post do
    description 'a description'
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/images/8.jpeg', 'image/jpeg')
    user_id 1
  end
end
