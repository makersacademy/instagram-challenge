# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    @user = build(:user)
    sign_in @user
    @post = build(:post)
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST # new" do
    it "redirects to homepage" do
      post :create, params: { post: { description: @post.description, image: @post.image } }
      expect(response).to redirect_to(welcome_index_url)
    end

    it "creates new post" do
      post :create, params: { post: { description: @post.description, image: @post.image } }
      expect(Post.find_by(description: @post.description)).to be
    end
  end

  describe "GET #edit" do
    it 'routes /posts/1/edit to posts#edit' do
      expect(get: '/posts/1/edit').to route_to(
        controller: 'posts',
        action: 'edit',
        id: '1'
      )
    end
  end

  describe "DELETE #destroy" do
    it 'validate route DELETE /posts/:id to posts#destroy' do
      expect(delete: "/posts/1").to route_to(
        controller: "posts",
        action: "destroy",
        id: "1"
      )
    end
  end
end





#   test "should get index" do
#     get posts_url
#     assert_response :success
#   end
#
#   test "should get new" do
#     get new_post_url
#     assert_response :success
#   end
#
#   test "should create post" do
#     assert_difference('Post.count') do
#       post posts_url, params: { post: { description: @post.description, image: @post.image, name: @post.name } }
#     end
#
#     assert_redirected_to post_url(Post.last)
#   end
#
#   test "should show post" do
#     get post_url(@post)
#     assert_response :success
#   end
#
#   test "should get edit" do
#     get edit_post_url(@post)
#     assert_response :success
#   end
#
#   test "should update post" do
#     patch post_url(@post), params: { post: { description: @post.description, image: @post.image, name: @post.name } }
#     assert_redirected_to post_url(@post)
#   end
#
#   test "should destroy post" do
#     assert_difference('Post.count', -1) do
#       delete post_url(@post)
#     end
#
#     assert_redirected_to posts_url
#   end
# end
