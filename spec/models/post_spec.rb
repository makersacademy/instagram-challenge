require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to belong_to :user }

  it { is_expected.to have_attached_file(:image) }

  it do
    is_expected.to validate_attachment_content_type(:image)
      .allowing('image/png', 'image/gif', 'image/jpg', 'image/jpeg')
      .rejecting('text/plain', 'text/xml', 'text/html')
  end

  describe '#created_by?' do
    let!(:user) { FactoryGirl.create(:user) }
    it 'returns true if a post was created by the user' do
      post = FactoryGirl.create(:post, user: user)
      expect(post.created_by? user).to be true
    end

    it 'returns false if post was created by a different user' do
      post = FactoryGirl.create(:post)
      expect(post.created_by? user).to be false
    end
  end
end
