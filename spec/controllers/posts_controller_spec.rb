require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET index" do
    it "assigns @post" do
      post = Post.create
      get :index
      expect(assigns(:post)).to be_kind_of(Post)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end

