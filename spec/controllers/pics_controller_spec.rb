require 'rails_helper'

RSpec.describe PicsController, type: :controller do

  let(:logged_in_user) { User.create(email: "a@a.com", password: "abc123") }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(logged_in_user)
  end

  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "creates a pic and redirects to the show page" do
      post :create, params: { pic: { title: "First pic", description: "This is the first pic", picture_file_name: "testpic.jpg" } }
      created_pic = Pic.find_by(title: "First pic")
      expect(created_pic).to be
      expect(response).to redirect_to(pic_url(created_pic.id))
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

end
