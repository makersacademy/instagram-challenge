include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :test_photo, class: Photo do
    trait :first do
      image do 
        fixture_file_upload(
          Rails.root.join('spec/factories/images', 'test.png'), 'image/png'
        )
      end
    end

    trait :second do
      image do 
        fixture_file_upload(
          Rails.root.join('spec/factories/images', 'test2.png'), 'image/png'
        )
      end
    end
  end
end 
