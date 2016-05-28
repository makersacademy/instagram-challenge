require 'spec_helper'

describe Picture, type: :model do
  it 'is not valid without a title' do
    picture = Picture.new(title: '')
    expect(picture).to have(1).error_on(:title)
    expect(picture).not_to be_valid
  end

  it { should have_many(:comments) }

  describe 'Comments:' do
    describe '#build_with_user' do

      let(:user) { User.create email: 'test@test.com' }
      let(:picture) { Picture.create title: 'Test' }
      let(:comment_params) { {author: 'Test', content: '<3'} }

      subject(:comment) { picture.comments.build_with_user(comment_params, user) }

      it 'builds a comment' do
        expect(comment).to be_a Comment
      end

      it 'builds a comment associated with the specified user' do
        expect(comment.user).to eq user
      end
    end
  end
end