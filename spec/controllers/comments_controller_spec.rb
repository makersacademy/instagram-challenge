# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'GET /new' do
    it 'responds with 200' do
      get :new, params: { message_id: 1 }
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    before(:each) do
      Message.create(user_id: 1, text: "Text")
    end

    it "redirects to message index" do
      post :create, params: { message_id: 1, comment: { user_id: 1, message_id: 1, text: "Hello, world!" } }
      expect(response).to redirect_to(messages_url)
    end

    it "creates a comment" do
      post :create, params: { message_id: 1, comment: { user_id: 1, message_id: 1, text: "Hello, world!" } }
      expect(Comment.find_by(text: "Hello, world!")).to be
    end
  end
end
