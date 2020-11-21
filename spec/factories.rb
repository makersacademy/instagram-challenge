FactoryBot.define do
  factory :user do
    username { "testperson" }
    email { "test@testing.com" }
    password { "pword123" }
    password_confirmation { "pword123" }
  end
#  factory :image, class: PhotoUploader do
#    image { fixture_file_upload(Rails.root.to_s + 'spec/fixtures/test.png', 'image/png') }
#  end
end
