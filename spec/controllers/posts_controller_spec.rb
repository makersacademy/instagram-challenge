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

    def valid_post
      post :create, params: { post: { caption: 'Test post', image: image } }
    end

    it 'should upload the file' do
      expect { valid_post }.to change{ ActiveStorage::Attachment.count }.by(1)
    end

    it 'should create the post' do
      expect { valid_post }.to change{ Post.count }.by(1)
      post = Post.last
      expect(post.image).to be_attached
      expect(post.image.filename).to eq FilesTestHelper.png_name
      expect(post.caption).to eq 'Test post'
     end
	end

end
