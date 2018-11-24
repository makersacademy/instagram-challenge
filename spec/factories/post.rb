FactoryBot.define do
  factory :post do
    association :user, factory: :user
    photo { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/uploads/bernard.jpg', 'image/jpeg'))}
  end
end
