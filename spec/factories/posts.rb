FactoryGirl.define do  
 factory :post do
   picture Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/google-test-framework.png')))
 end
end