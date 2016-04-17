FactoryGirl.define do

  factory :post do |f|
    f.sequence(:caption) { |n| "cheeky monkey#{n}" }
    f.image Rack::Test::UploadedFile.new("#{Rails.root}/spec/assets/images/monkey.jpg", "image/jpg")
  end

  factory :comment do |f|
    f.sequence(:content) { |n| "Great photo#{n}" }
  end

  factory :user do |u|
    u.sequence(:email) { |n| "user#{n}@gmail.com" }
    u.password 'abcd1234'
    u.password_confirmation 'abcd1234'
  end

end
