require 'factory_girl'
FactoryGirl.define do
  factory :post do
    caption "cute kitty"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/kitten.png', 'image/png')
  end
end
