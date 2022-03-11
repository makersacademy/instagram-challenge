FactoryBot.define do
  factory :user do
    username { Faker::Name.unique.name }
    email { Faker::Internet.email(domain: 'example') }
    password { "password" }
    transient do
      post { create(:post) }
    end
  end

  factory :post do
    image { Rack::Test::UploadedFile.new('/Users/Student/Projects/weekend-challenges/instagram-challenge/spec/features/test_image.png', 'image/png') }
    caption { Faker::Lorem.sentence }
    association :user
      # transient do |post|
      #   image_file_path = '/Users/Student/Projects/weekend-challenges/instagram-challenge/spec/features/test_image.png'
      #   file = fixture_file_upload(file_path, 'image/png')
      #   account.avatar.attach(file)
      # end
  end
end
