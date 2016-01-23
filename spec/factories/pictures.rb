FactoryGirl.define do
  factory :picture do
    trait :picture_only do
      file { fixture_file_upload 'test.jpg', 'image/jpg' }
    end

    trait :picture_description do
      file { fixture_file_upload 'test.jpg', 'image/jpg' }
      description 'My posted picture'
    end
  end
end
