FactoryGirl.define do
  factory :post do
    title 'Test title'
    photo Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/factories/Trollface.png')))
    user
  end
end
