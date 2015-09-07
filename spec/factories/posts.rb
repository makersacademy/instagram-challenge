include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :post do
    image { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.jpg'), 'image/jpg') }
    description 'wow'
    user
  end
end
