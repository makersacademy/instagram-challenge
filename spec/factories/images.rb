include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :image do
    pic { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.jpg'), 'image/jpg') }
    user
  end
end
