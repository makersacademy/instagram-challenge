include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :picture do
    image { fixture_file_upload './spec/factories/test.jpg', 'image/jpg' }
    description 'My posted picture'
    user
  end
end
