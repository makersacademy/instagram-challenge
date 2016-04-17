require 'rails_helper'

describe 'likes' do
  describe 'build_with_user' do

    let(:user) { User.create email: 'test@test.com' }
    let(:photo) { Photo.create caption: 'Test' }

    subject(:like) { photo.likes.build_with_user(user) }

    it 'builds a like' do
      expect(like).to be_a Like
    end

    it 'builds a like associated with the specified user' do
      expect(like.user).to eq user
    end
  end
end
