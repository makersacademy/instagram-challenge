include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :post do
    user { create(:user) }
    caption "caption"
    image { fixture_file_upload("spec/files/images/test.jpg", 'image/jpg') }
  end
end
