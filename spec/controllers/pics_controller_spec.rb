require 'rails_helper'

RSpec.describe PicsController, type: :controller do

  before do
    @alina = User.create(email: "a@a.com", password: "abc123")
    sign_in @alina
  end

  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "redirects to the show page" do
      post :create, params: { pic: { title: "First pic", description: "This is the first pic", picture_file_name: "testpic.jpg" } }
      created_pic = Pic.find_by(title: "First pic")
      expect(response).to redirect_to(pic_url(created_pic.id))
    end

    it "creates a pic" do
      post :create, params: { pic: { title: "First pic", description: "This is the first pic", picture_file_name: "testpic.jpg" } }
      created_pic = Pic.find_by(title: "First pic")
      expect(created_pic.title).to eq("First pic")
      expect(created_pic.description).to eq("This is the first pic")
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "EDIT /update" do
    it "edits a pic" do
      @pic = Pic.create(title: "First pic", description: "This is the first pic", picture_file_name: "testpic.jpg", user: @alina)
      put :update, params: { id: @pic.id, pic: { title: 'Fist pic - updated' } }
      expect(Pic.find_by(title: 'Fist pic - updated')).to be
      put :update, params: { id: @pic.id, pic: { description: "This is the first pic - updated" } }
      expect(Pic.find_by(description: "This is the first pic - updated")).to be
    end
  end

  context 'when the user is not the owner of the pic' do
    let(:pic_creator) { User.create(email: 't@t.com', password: 'password') }

    it "does not update the pic" do
      @pic = Pic.create(title: "First pic", description: "This is the first pic", picture_file_name: "testpic.jpg", user: pic_creator)
      put :update, params: { id: @pic.id, pic: { title: 'Fist pic - updated' } }
      expect(Pic.find_by(title: 'Fist pic - updated')).to be nil
    end
  end

  describe "DELETE /destroy" do
    it "deletes a pic" do
      @pic = Pic.create(title: "First pic", description: "This is the first pic", picture_file_name: "testpic.jpg", user: @alina)
      expect {
        delete :destroy, params: { id: @pic.id }
      }.to change(Pic, :count).by(-1)
    end
  end
end
