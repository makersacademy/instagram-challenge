FactoryGirl.define do
  factory :photo do
    description 'Testing'
    image File.new("#{Rails.root}/spec/support/fixtures/images/testing.png")
    user

    factory :photo_without_user do
      user_id nil
    end
  end
end
