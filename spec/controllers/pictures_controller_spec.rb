require 'rails_helper'

RSpec.describe PicturesController, type: :controller do
  let(:valid_attributes)   { { image: "test.png", description: "hello" } }
  let(:invalid_attributes) { { image: nil, description: "wrong" } }
  let!(:picture)           { Picture.create }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: picture.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: picture.to_param }
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Picture" do
        expect {
          post :create, params: { picture: { image: "test.png", description: "test" } }
        }.to change(Picture, :count).by(1)
      end

      it "redirects to the created picture" do
        post :create, params: { picture: valid_attributes }
        expect(response).to redirect_to(Picture.last)
      end
    end

    context "with invalid params" do
      it "returns a failure response" do
        post :create, params: { picture: invalid_attributes }
        expect(response).to_not be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { image: "test.png", description: "goodbye" } }

      it "updates the requested picture" do
        put :update, params: { id: picture.to_param, picture: new_attributes }
        picture.reload
        expect(picture.description).to eq "goodbye"
      end

      it "redirects to the picture" do
        put :update, params: {id: picture.to_param, picture: valid_attributes}
        expect(response).to redirect_to(picture)
      end
    end

    context "with invalid params" do
      it "returns a failure response" do
        put :update, params: {id: picture.to_param, picture: invalid_attributes}
        expect(response).to_not be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested picture" do
      expect {
        delete :destroy, params: {id: picture.to_param}
      }.to change(Picture, :count).by(-1)
    end

    it "redirects to the pictures list" do
      delete :destroy, params: {id: picture.to_param}
      expect(response).to redirect_to(pictures_url)
    end
  end

end
