require 'rails_helper'

describe Comment, type: :model do
  it { is_expected.to belong_to :post }
  it { is_expected.to belong_to :user }

  describe 'Comments' do
    describe 'Deleting Comments' do
      let(:user) { create(:user, email: 'testing@testing.com', username: 'seamonkey') }
      let(:user2) { create(:user, email: 'creator@creator.com', username: 'potato') }
      let(:post) { create(:post) }
      let(:comment) { create(:comment, user: user) }

      scenario 'only the creator can delete comments' do
        comment.destroy_as_user(user)
        expect(Comment.first).to be nil
      end

      scenario 'non-creators cannot delete comments' do
        comment.destroy_as_user(user2)
        expect(Comment.first).to eq comment
      end
    end
  end
end
