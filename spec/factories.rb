FactoryBot.define do
  factory :like do
    post { nil }
    user { nil }
  end

  factory :user do
    
  end

  factory :post do
    caption { "nofilter" }
    picture { Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/coffee.jpeg', 'image/jpeg') }
  end
end
