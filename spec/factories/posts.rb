# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    caption { 'Amazing sunrise! #sunrise' }
    image { Rack::Test::UploadedFile.new("#{Rails.root}spec/files/images/sunrise.jpg", 'image/jpg') }
    user_id { 1 }
  end
end
