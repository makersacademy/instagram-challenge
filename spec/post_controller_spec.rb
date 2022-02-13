require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  before(:each) do
    user = User.create(
      {name: 'test name',
       usernname: 'test username', 
       email: 'test@test.com', 
       password: '123456'})

  end

  describe "GET /new " do
    it("responds with 200") do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it("responds with 302") do
      post :create, params: { 
      post: { 
          image: Rack::Test::UploadedFile.new(Rails.root.join('spec/test_image.jpg'), 'image/jpg'),
          caption: "#Donuts",
          user_id: 1
          }
      }
      expect(response).to have_http_status(302)
    end

    it("creates a post") do
      post :create, params: { 
      post: { 
          image: Rack::Test::UploadedFile.new(Rails.root.join('spec/test_image.jpg'), 'image/jpg'),
          caption: "#Donuts",
          user_id: 1
          }
      }
      expect(Post.find_by_caption("#Donuts")).to be
    end
  end
end
