FactoryGirl.define do
  factory :post do |f|
    f.sequence(:caption) { |n| "cheeky monkey#{n}" }
    f.image Rack::Test::UploadedFile.new("#{Rails.root}/spec/images/monkey.jpg", "image/jpg")
  end
end
