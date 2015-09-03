require 'rails_helper'

describe Comment, type: :model do

  before do
    user = create(:user)
    user.comments.create(my_comment: 'who is this?')
  end

  it { is_expected.to belong_to :picture }
  it { is_expected.to belong_to :user }

  it 'can be deleted by the user who posted it' do
    comment = Comment.find_by(my_comment: 'who is this?')
    current_user = User.find_by(username: 'katsuraku')
    comment.destroy_as current_user
    expect(Comment.find_by(my_comment: 'who is this?')).to be nil
  end

  it 'cannot be deleted by a user other then the one who posted it' do
    comment = Comment.find_by(my_comment: 'who is this?')
    user2 = User.create email: 'katsuraku@gmail.com', password: 'kjkjkjkj', password_confirmation: 'kjkjkjkj', username: 'kjones'
    expect(comment.destroy_as user2).to be false
  end

  describe 'build_with_user' do
    let(:user) { User.create email: 'k@jones.com', username: 'katsuraku' }
    let(:pic) { Picture.create caption: 'Yo', image_file_name: "monkeys.jpg" }
    let(:comment_params) { {my_comment: 'who is this?'} }
    subject(:comment) { pic.comments.build_with_user(comment_params, user) }

    it 'builds a comment' do
      expect(comment).to be_a Comment
    end

    it 'builds a comment associated with the specified user' do
      expect(comment.user).to eq user
    end
  end
end
