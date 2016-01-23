FactoryGirl.define do
  factory :picture do
    title Faker::Book.title
    description Faker::Lorem.sentence
    association :user
    image do
      Rack::Test::UploadedFile.new('spec/fixtures/images/test.png', 'image/png')
    end
  end
end
