FactoryBot.define do
  factory :post do
    user

    caption "no filter"
    image Rack::Test::UploadedFile.new(Rails.root +
    'spec/files/images/dog.jpg', 'image/jpg')
  end
end
