require 'rails_helper'

RSpec.describe "PostLikes", type: :request do
  describe "Post /create" do
    it "returns http success" do
      post = Post.create(content: 'post_content', image: fixture_file_upload('./spec/fixtures/test-image.jpeg'), author: 'Author' )
      post "/post_likes", params: {post: { post_id: post.id }}
      expect(response).to have_http_status(302)
    end
  end
end