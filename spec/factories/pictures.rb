FactoryGirl.define do
  sequence :description do
    Faker::Lorem.sentence
  end

  factory :picture do
    description { generate :description }
    association :user
    image do
      Rack::Test::UploadedFile.new('spec/fixtures/images/test.png', 'image/png')
    end
  end
end
