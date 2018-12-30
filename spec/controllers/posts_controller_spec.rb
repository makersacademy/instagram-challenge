require 'rails_helper'
require_relative '../support/files_test_helper.rb'

RSpec.describe PostsController, type: :controller do

  describe "GET #index" do

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create' do

    let(:image) { FilesTestHelper.png }

    def create_post
      post :create, params: { post: { caption: 'Test post', image: image } }
    end

    it 'should upload the file' do
      expect { create_post }.to change{ ActiveStorage::Attachment.count }.by(1)
    end

    it 'should create the post' do
      expect { create_post }.to change{ Post.count }.by(1)
      post = Post.last
      expect(post.image).to be_attached
      expect(post.image.filename).to eq FilesTestHelper.png_name
      expect(post.caption).to eq 'Test post'
     end

    it 'should redirect to posts_url upon post save' do
      create_post
      expect(response).to redirect_to posts_url
    end
	end

  describe "DELETE #destroy" do

    let!(:post) { FactoryBot.create(:post) }

    def delete_post
      delete :destroy, params: { id: post.id }
    end

    it "deletes post from database" do
      expect { delete_post }.to change { Post.count }.by(-1)
    end

    it "redirects to posts index" do
      delete_post
      expect(response).to redirect_to posts_url
    end
  end

end
