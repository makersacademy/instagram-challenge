require 'spec_helper'

describe Comment, type: :model do

  it { is_expected.to belong_to :image }

  it { is_expected.to belong_to :user }

end

describe 'build_with_user' do

  let(:user) { User.create email: 'test@test.com' }
  let(:image) { Image.create name: 'Test' }
  let(:comment_params) { {comment: 'my comment'} }

  subject(:comment) { image.comments.build_with_user(comment_params, user) }

  it 'builds a comment' do
    expect(comment).to be_a Comment
  end

  it 'builds a comment associated with the specified user' do
     expect(comment.user).to eq user
  end
end

