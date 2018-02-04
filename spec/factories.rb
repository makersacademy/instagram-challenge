FactoryBot.define do
  factory :comment do
    user { create(:user) }
    post { create(:post) }
    content "This is my comment"
  end
  
  factory :user do
    sequence :email do |n|
        "person#{n}@test.com"
      end
      sequence :user_name do |n|
        "bob#{n}"
      end
      password "testing"
  end

  factory :post do
    user { create(:user) }
    caption "test caption"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/greatview.jpeg', 'image/jpg')
  end
end
