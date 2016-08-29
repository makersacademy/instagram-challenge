require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is not vaild without a caption' do
    post = Post.new(caption: "")
    expect(post).to have(1).error_on(:caption)
    expect(post).not_to be_valid
  end


  let!(:user) {User.create(email: 'test@test.com', password: 'testtest')}
  let!(:user2) {User.create(email: 'test2@test.com', password: 'testtest')}
  let(:post_params) { {caption: 'sunset'}}
  subject!(:post) {user.posts.build_with_user(post_params, user)}


  describe 'build_with_user' do

    it 'builds a post' do
      expect(post).to be_a(Post)
    end

    it 'builds a post associated with the specified user' do
      expect(post.user).to eq(user)
    end
  end

  describe 'delete_with_user' do

    it 'deletes a users post' do
      post.save
      expect(Post.count).to eq(1)
      user.posts.delete_with_user(post, user[:id])
      expect(Post.count).to eq(0)
    end

    it "will not delete a post if it doesn't belong to the user" do
      post.save
      user2.posts.delete_with_user(post, user2[:id])
      expect(Post.count).not_to eq(0)
    end
  end
end
