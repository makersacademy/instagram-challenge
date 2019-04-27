require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:post1) { FactoryBot.create(:post, user_id: user.id) }

  before do
    sign_in user
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { comment: { user_id: user.id, post_id: post1.id, body: "Hello!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a like" do
      post :create, params: { comment: { user_id: user.id, post_id: post1.id, body: "Hello!" } }
      expect(Post.find_by(user_id: user.id)).to be Post
    end
  end

end
