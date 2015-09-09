require 'rails_helper'

describe Post, type: :model do
  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it { is_expected.to validate_presence_of :image }
  it { is_expected.to validate_presence_of :user }
  it { is_expected.to have_many(:likes).dependent(:destroy) }
  it { is_expected.to belong_to :user }

  it 'is not valid to create post without image' do
    post = Post.new(caption: 'Great')
    expect(post).to have(1).error_on(:image)
    expect(post).not_to be_valid
  end

  it 'is valid with images' do
    post = create(:post)
    expect(post).to be_valid
  end

  context 'Creating posts without user' do
    it 'is not valid to create post without being signed in' do
      post = Post.create(caption: '#life', image_file_name: 'spec/asset_spec/images/testing.png')
      expect(post).not_to be_valid
    end

    it 'is valid to create post if signed in' do
      user = create(:user)
      post = Post.create(caption: '#life', image_file_name: 'spec/asset_spec/images/testing.png', user: user)
      expect(post).to be_valid
    end
  end

  describe 'Posts' do
    let(:user) { create(:user, username: 'seamonkey') }
    let(:user2) { create(:user, email: 'testing@testing.com') }
    let(:post) { create(:post, user: user) }

    describe 'updating posts with users' do
      let(:post_params) { {caption: 'Coffee and music'} }

      scenario 'only the creator can update posts' do
        post.update_as_user(post_params, user)
        expect(Post.first.caption).to eq('Coffee and music')
      end

      scenario 'non-creators cannot update posts' do
        post.update_as_user(post_params, user2)
        expect(Post.first.caption).to eq('#life')
      end
    end

    describe 'deleting posts with users' do
      scenario 'only the creator can delete posts' do
        post.destroy_as_user(user)
        expect(Post.first).to be nil
      end

      scenario 'cannot be deleted by non creator' do
        post.destroy_as_user(user2)
        expect(Post.first).to eq post
      end
    end

  end

  describe 'Likes' do
    describe 'build_with_user' do
      let(:user) { create(:user) }
      let(:post) { create(:post, user: user) }
      subject(:like) { post.likes.build_with_user(user) }

      it 'increments like' do
        expect(like).to be_a Like
      end

      it 'builds a like associated with a user' do
        expect(like.user).to eq user
      end



    end
  end

end
