FactoryBot.define do
  factory :picture do
    caption "MyText"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/images/ah.jpg')
    user_id 1
  end
end
