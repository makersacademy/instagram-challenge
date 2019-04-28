require 'rails_helper'
require 'database_cleaner'

RSpec.describe LikesController, type: :controller do
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
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
      expect(Comment.where(user_id: user.id)).to be
    end
  end

end
