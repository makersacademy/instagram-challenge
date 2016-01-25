require 'rails_helper'

describe Photo, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_attached_file :image }

  it do
    is_expected.to validate_attachment_content_type(:image)
      .allowing('image/png', 'image/gif', 'image/jpg', 'image/jpeg')
      .rejecting('text/plain', 'text/xml', 'text/html')
  end

  describe '#posted_by?' do
    let!(:user) { create(:user) }

    it 'returns true if post was created by the user' do
      photo = create(:test_photo, user: user)
      expect(photo.posted_by?(user)).to be true
    end

    it 'returns false if post was created by a different user' do
      photo = create(:test_photo)
      expect(photo.posted_by?(user)).to be false
    end
  end
end
