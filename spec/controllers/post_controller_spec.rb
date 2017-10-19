require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:valid_attributes) { { title: "Hello, world!",
                             photo: fixture_file_upload(Rails.root + 'spec/factories/Trollface.png', "image/png")
  } }

  let(:invalid_attributes) { { title: "" } }

  describe "GET /new " do
    it "responds with 200" do
      sign_in
      get :new
      expect(response).to have_http_status 200
    end
  end

  describe "POST /" do
    before(:each) do
      sign_in
    end

    it "responds with 200" do
      post :create, params: { post: valid_attributes }
      expect(response).to redirect_to posts_url
    end

    it "creates a post" do
      post :create, params: { post: valid_attributes }
      expect(Post.find_by(title: "Hello, world!")).to be
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        post :create, params: { post: invalid_attributes }
        expect(assigns(:post)).to be_a_new Post
      end

      it "re-renders the 'new' template" do
        post :create, params: { post: invalid_attributes }
        expect(response).to render_template "new"
      end
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status 302
    end
  end
end
