FactoryGirl.define do
  factory :post do
    user { create(:user) }
    caption "hello world"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/octocat.jpg', 'image/jpg')
  end
end
