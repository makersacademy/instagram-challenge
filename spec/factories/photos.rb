FactoryGirl.define do
  factory :photo do
    before(:create) do |photo|
      user = FactoryGirl.create(:user)
      photo.user_id = user.id
    end
    description "MyText"
    image { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'rubber_duck.jpg'), 'image/jpg') }
  end
end
