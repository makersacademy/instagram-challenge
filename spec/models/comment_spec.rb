require 'rails_helper'
require 'spec_helper'

describe Comment, type: :model do

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:post) }

  # it 'is not valid without any characters' do
  #   comment = Comment.new(text: '')
  #   expect(comment).to have(1).error_on(:text)
  #   expect(comment).not_to be_valid
  # end

end

describe 'build_with_user' do

  # let(:user) { User.create email: 'test@test.com' }
  # let(:post) { Post.create name: 'Gin' }
  # let(:comment_params) { {comment: 'Mother\'s ruin'} }
  #
  # subject(:comment) {
  #   image.comments.build_with_user(comment_params, user)
  # }
  #
  # it 'builds a comment' do
  #   expect(comment).to be_a Comment
  # end
  #
  # it 'associates a particular comment to a it\'s user' do
  #    expect(comment.user).to eq user
  # end

end
