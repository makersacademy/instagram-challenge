require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "Post" do
    let(:post) { { image: "i", caption: "caption" } }
    let(:params) { { post: post } }

    it "creates a post" do
      # expect{ post }.to change{ Post.count }.by(1)
      expect{ post :create, params: params }.to change{ Post.count }.by(1)
    end
  end
end
