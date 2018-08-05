# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    caption "number one"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/one.jpg', 'image/jpg')
  end
end
