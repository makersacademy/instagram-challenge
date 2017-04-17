include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :post do
    image { fixture_file_upload("#{Rails.root}/spec/support/fixtures/giraffe-dog.jpg", 'image/jpeg')  }
    image_content_type 'image/jpeg'
    user_id 1
  end

  factory :user do
    username "DeathRay1977"
    email "norm@example.com"
    password "HeyHeyHey"
  end

  factory :comment do
    body 'Fantastic'
    user_id 1
    post_id 1
  end
end
