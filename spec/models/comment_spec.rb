require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to :photo }
  it { is_expected.to belong_to :user }

  describe 'build with user in params' do
    let(:user) { User.create(email: "alex@email.com", password: "8characters") }
    let(:photo) { Photo.create(title: "woo") }
    let(:comment_params) { { comment: 'hoo', user: user }  }

    subject(:comment) { photo.comments.create(comment_params) }

    it 'builds a comment' do
      expect(comment).to be_a Comment
    end

    it 'builds a comment associated with the specified user' do
    expect(comment.user).to eq user
    end
  end

end
