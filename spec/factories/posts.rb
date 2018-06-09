FactoryBot.define do
  factory :post do
    description "My Picture"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/mum.jpeg', 'image/jpeg')
  end
end
