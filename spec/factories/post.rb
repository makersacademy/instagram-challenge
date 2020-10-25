FactoryBot.define do 
  factory :post do 
    image { Rack::Test::UploadedFile.new(Rails.root + 'spec/images/tree.jpg') }
    caption { 'This is my first post' }
  end 
end 