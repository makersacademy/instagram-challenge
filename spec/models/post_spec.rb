require 'rails_helper'

RSpec.describe Post, type: :model do

  it {is_expected.to belong_to(:user)}

  describe 'Images' do
    let(:user) { User.create email: 'test@test.test' }

    it 'should be valid with image file' do
      post = user.posts.new image: File.new(Rails.root + 'spec/fixtures/images/freedom-beach.jpg'), caption: 'Cool'
      expect(post).to be_valid
    end

    it 'should not be valid without image file' do
      post = user.posts.new caption: 'Cool'
      expect(post).not_to be_valid
    end
  end

  describe 'Captions' do
    let(:user) { User.create email: 'test@test.test' }
    it 'should be valid with caption' do
      post = user.posts.new(image: File.new(Rails.root + 'spec/fixtures/images/freedom-beach.jpg'), caption: 'Cool')
      expect(post).to be_valid
    end

    it 'should not be valid without caption' do
      post = user.posts.new(image: File.new(Rails.root + 'spec/fixtures/images/freedom-beach.jpg'))
      expect(post).to have(1).error_on(:caption)
    end
  end

  describe 'Comments' do
    describe 'build_with_user' do
      let(:user) { User.create email: 'test@test.test' }
      let(:post) { Post.create image: File.new(Rails.root + 'spec/fixtures/images/freedom-beach.jpg'), caption: 'Cool'}
      let(:comment_params) { {text: 'average'} }

      subject(:comment) { post.comments.build_with_user(comment_params, user) }

      it 'builds a comment' do
        expect(comment).to be_a Comment
      end

      it 'builds a comment associated with the user' do
        expect(comment.user).to eq user
      end
    end
  end


end
