include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :post do
    caption "MyString"
    image { fixture_file_upload("spec/files/images/test.jpg", 'image/jpg') }
  end
end
