# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  describe "POST /" do
    before(:each) do
      Message.create(user_id: 1, text: "Text")
    end

    it "redirects to message index" do
      post :create, params: { message_id: 1, like: { user_id: 1, message_id: 1 } }
      expect(response).to redirect_to(messages_url)
    end

    it "creates a post" do
      post :create, params: { message_id: 1, like: { user_id: 1, message_id: 1 } }
      binding.pry
      expect(Like.all).to be
    end
  end
end
