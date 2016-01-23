FactoryGirl.define do
  factory :picture do
    description Faker::Lorem.sentence
    association :user
    image do
      Rack::Test::UploadedFile.new('spec/fixtures/images/test.png', 'image/png')
    end
  end
end
