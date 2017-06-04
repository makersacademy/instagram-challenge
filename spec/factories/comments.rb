FactoryGirl.define do
  factory :comment do
    before(:create) do |comment|
      FactoryGirl.reload
      photo = FactoryGirl.create(:photo)
      user = FactoryGirl.create(:user)
      comment.user_id = user.id
      comment.photo_id = photo.id
    end
    body 'What a great photo!'
  end
end
