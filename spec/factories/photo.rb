FactoryBot.define do
  factory :photo do
    title "no filter"
    description "beautiful"
    photo Rack::Test::UploadedFile.new(Rails.root + 'spec/asset_specs/photos/photo.jpeg')
    image_url '/api/photos'
    user_id 1
  end
end
