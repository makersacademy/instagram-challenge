# FactoryGirl.define do
#   factory :post do
#     caption "MyString"
#   end
# end

FactoryGirl.define do
  factory :post do
    caption "nofilter"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/weebl.jpg', 'image/jpg')
  end
end
