require 'rails_helper'

describe Photo, type: :model do

  it { is_expected.to belong_to :user}

  it { is_expected.to have_many :comments}
  it { should have_many(:comments).dependent(:destroy) }


  describe 'reviews' do
    describe 'build_with_user' do

      let(:user) { User.create email: 'test@test.com' }
      let(:photo) { Photo.create caption: 'Test' }
      let(:comment_params) { {content: "Comment text"} }

      subject(:comment) { photo.comments.build_with_user(comment_params, user) }

      it 'builds a comment' do
        expect(comment).to be_a Comment
      end

      it 'builds a comment associated with the specified user' do
        expect(comment.user).to eq user
      end
    end
  end
end
