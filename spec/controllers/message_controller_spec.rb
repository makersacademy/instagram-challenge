# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /new' do
    it 'responds with 200' do
      get :new, params: { user_id: 1 }
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /profile' do
    it 'responds with 200' do
      get :profile, params: { user_id: 1 }
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "redirects to message index" do
      post :create, params: { user_id: 1, message: { text: "Hello, world!" } }
      expect(response).to redirect_to(messages_url)
    end

    it "creates a post" do
      post :create, params: { user_id: 1, message: { text: "Hello, world!" } }
      expect(Message.find_by(text: "Hello, world!")).to be
    end
  end
end
