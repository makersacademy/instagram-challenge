include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :post do
    description 'Description text'
    image { fixture_file_upload './spec/images/cat.png', 'image/png' }
  end
end
