require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { User.create(username: "TestUser", email: "Test@example.com", password: "password") }
  before(:each) do
    sign_in user
  end

  describe "GET /posts" do
    it "returns 200 ok" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  # This test is generating an ActiveSupport::MessageVerifier::InvalidSignature error.
  # I'm at a total blocker about how to solve this error.
  describe 'POST #create' do
    it 'attaches the uploaded file' do
      file = file_fixture('test_image.png')
      expect {
  		    post :create, params: { post: { image: file } }
      }.to change(ActiveStorage::Attachment, :count).by(1)
    end
  end
end
