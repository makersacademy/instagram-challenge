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

    # describe "GET #edit" do
    #   it "returns a success response" do
    #     pic = Pic.create! valid_attributes
    #     get :edit, params: { id: pic.to_param }, session: valid_session
    #     expect(response).to be_successful
    #   end
    # end
    #
    # describe "POST #create" do
    #   context "with valid params" do
    #     it "creates a new Pic" do
    #       expect {
    #         post :create, params: { pic: valid_attributes }, session: valid_session
    #       }.to change(Pic, :count).by(1)
    #     end
    #
    #     it "redirects to the created pic" do
    #       post :create, params: { pic: valid_attributes }, session: valid_session
    #       expect(response).to redirect_to(Pic.last)
    #     end
    #   end
    #
    #   context "with invalid params" do
    #     it "returns a success response (i.e. to display the 'new' template)" do
    #       post :create, params: { pic: invalid_attributes }, session: valid_session
    #       expect(response).to be_successful
    #     end
    #   end
    # end
    #
    # describe "PUT #update" do
    #   context "with valid params" do
    #     let(:new_attributes) {
    #       skip("Add a hash of attributes valid for your model")
    #     }
    #
    #     it "updates the requested pic" do
    #       pic = Pic.create! valid_attributes
    #       put :update, params: { id: pic.to_param, pic: new_attributes }, session: valid_session
    #       pic.reload
    #       skip("Add assertions for updated state")
    #     end
    #
    #     it "redirects to the pic" do
    #       pic = Pic.create! valid_attributes
    #       put :update, params: { id: pic.to_param, pic: valid_attributes }, session: valid_session
    #       expect(response).to redirect_to(pic)
    #     end
    #   end
    #
    #   context "with invalid params" do
    #     it "returns a success response (i.e. to display the 'edit' template)" do
    #       pic = Pic.create! valid_attributes
    #       put :update, params: { id: pic.to_param, pic: invalid_attributes }, session: valid_session
    #       expect(response).to be_successful
    #     end
    #   end
    # end
    #
    # describe "DELETE #destroy" do
    #   it "destroys the requested pic" do
    #     pic = Pic.create! valid_attributes
    #     expect {
    #       delete :destroy, params: { id: pic.to_param }, session: valid_session
    #     }.to change(Pic, :count).by(-1)
    #   end
    #
    #   it "redirects to the pics list" do
    #     pic = Pic.create! valid_attributes
    #     delete :destroy, params: { id: pic.to_param }, session: valid_session
    #     expect(response).to redirect_to(pics_url)
    #   end
    # end

end
