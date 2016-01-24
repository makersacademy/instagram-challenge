include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :test_photo, class: Photo do
    image do 
      fixture_file_upload(
        Rails.root.join('spec', 'images', 'test.png'), 'image/png'
      )
    end
  end

  factory :test_photo_two, class: Photo do
    image do 
      fixture_file_upload(
        Rails.root.join('spec', 'images', 'test2.png'), 'image/png'
      )
    end
  end
end 
