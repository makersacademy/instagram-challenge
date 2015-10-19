FactoryGirl.define do
  factory :post do
    caption 'Factory caption is here'
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/features/test.jpg',
                                      'image/jpg')
  end
end
