FactoryGirl.define do  
  factory :picture do
  	caption "nofilter"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/coffee.jpg', 'image/jpg')
  	user_id "2"
  end
end