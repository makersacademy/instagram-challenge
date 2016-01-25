require 'rails_helper'

describe Like, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :picture }
  it { is_expected.to validate_presence_of :user }
  it { is_expected.to validate_presence_of :picture }
  it 'is invalid if the user already liked a picture' do
    user    = create(:user)
    picture = create(:picture)
    create(:like, picture: picture, user: user)
    like = Like.new(picture: picture, user: user)
    expect(like).to have(1).error_on(:user)
  end
end
