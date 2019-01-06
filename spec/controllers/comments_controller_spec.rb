# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:dummy_post) { FactoryBot.create(:post) }

  describe "POST #create" do
    let(:user) { FactoryBot.create(:user) }
    let(:comment) { FactoryBot.build(:comment) }

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
    let!(:comment) { FactoryBot.create(:comment) }

    def delete_comment
      delete :destroy, params: { post_id: comment.post.id, id: comment.id }
    end

    it "deletes a comment" do
      expect { delete_comment }.to change { Comment.count }.by(-1)
    end

    it "redirects to post path" do
      delete_comment
      expect(response).to redirect_to post_path(comment.post.id)
    end
  end
end
