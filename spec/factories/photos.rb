FactoryGirl.define do
  factory :photo do
    before(:create) do |photo|
      user = FactoryGirl.create(:user)
      photo.user_id = user.id
    end
    description "MyText"
    image "MyString.jpg"
  end
end
