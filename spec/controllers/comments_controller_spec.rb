require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:dummy_post) { FactoryBot.create(:post) }
  let(:user) { FactoryBot.create(:user) }
  let(:comment) { FactoryBot.build(:comment) }

  describe "POST #create" do

    def create_comment
      allow(controller).to receive(:current_user).and_return(user)
      post :create, params: { post_id: dummy_post.id, comment: { body: comment.body  } }
    end

    it "creates a comment" do
      expect { create_comment }.to change { Comment.count }.by(1)
    end

    it "redirects to post path" do
      create_comment
      expect(response).to redirect_to post_path(dummy_post)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
