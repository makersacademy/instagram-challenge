# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    @user = create(:user)
    sign_in @user
    @post = create(:post)
  end

  describe "POST #new" do
    it "redirects to homepage" do
      post :create, params: { comment: { body: 'Hello, potato!' }, post_id: @post.id  }
      expect(response).to redirect_to(welcome_index_url)
    end

    it 'creates new comment' do
      post :create, params: { comment: { body: 'Hello, potato!' }, post_id: @post.id  }
      expect(Comment.find_by(body: 'Hello, potato!')).to be
      expect {
        post :create, params: { comment: { body: 'Hello, potato!' }, post_id: @post.id  }
      }.to change(Comment, :count).by(1)
    end
  end
end
