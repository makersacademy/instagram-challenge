FactoryBot.define do
  factory :comment do
    text { "MyString" }
    post { nil }
    user { nil }
  end

  factory :like do
    post { nil }
    user { nil }
  end

  factory :user do
    email { "email@email.com" }
    password { 123456 }
    password_confirmation { 123456 }
  end

  factory :post do
    caption { "nofilter" }
    picture { Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/coffee.jpeg', 'image/jpeg') }
  end
end
