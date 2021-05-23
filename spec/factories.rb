FactoryBot.define do
  factory :post do
    caption { "nofilter" }
    picture { Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/coffee.jpeg', 'image/jpeg') }
  end
end
