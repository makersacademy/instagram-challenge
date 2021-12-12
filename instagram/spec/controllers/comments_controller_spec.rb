require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before do
    @post = Post.create(title: "This is a post")
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post_id: @post.id, comment: { body: "this is a comment", post_id: @post.id } }
      expect(response).to redirect_to("/posts/#{@post.id}")
    end

    it "creates a comment" do
      post :create, params: { post_id: @post.id, comment: { body: "this is another comment", post_id: @post.id } }
      expect(Comment.find_by(body: "this is another comment")).to be
    end
  end
end
