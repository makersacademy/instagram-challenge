require 'rails_helper'

RSpec.describe Photo, type: :model do
  it{ is_expected.to have_many(:comments).dependent(:destroy)}
  it{ is_expected.to have_many(:likes) }
  it{ is_expected.to belong_to :user}

end

describe 'comments' do
  describe 'build_with_user' do

    let(:user) { User.create email: 'test@test.com', password: '12345678' }
    let(:photo) { Photo.create description: 'Test' }
    let(:comment_params) { {comment: 'so so'} }

    subject(:comment) { photo.comments.build_with_user(comment_params, user) }

    it 'builds a comment' do
      expect(comment).to be_a Comment
    end

    it 'builds a comment associated with the specified user' do
      expect(comment.user).to eq user
    end
  end
end
