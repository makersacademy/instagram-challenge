require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Photo. As you add validations to Photo, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { image: "photo", description: "description" }
  }

  let(:invalid_attributes) {
    { image: " " }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PhotosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      photo = Photo.create! valid_attributes
      get :index, params: { image: photo.image, description: photo.description }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      photo = Photo.create! valid_attributes
      get :show, params: {id: photo.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      photo = Photo.create! valid_attributes
      get :edit, params: {id: photo.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Photo" do
        expect {
          post :create, params: {photo: valid_attributes}, session: valid_session
        }.to change(Photo, :count).by(1)
      end

      it "redirects to the created photo" do
        post :create, params: {photo: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Photo.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {photo: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { image: "new photo", description: "new description" }
      }

      it "updates the requested photo" do
        photo = Photo.create! valid_attributes
        put :update, params: {id: photo.to_param, photo: new_attributes}, session: valid_session
        photo.reload
        expect(photo.description).to eq "new description"
      end

      it "redirects to the photo" do
        photo = Photo.create! valid_attributes
        put :update, params: {id: photo.to_param, photo: valid_attributes}, session: valid_session
        expect(response).to redirect_to(photo)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        photo = Photo.create! valid_attributes
        put :update, params: {id: photo.to_param, photo: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested photo" do
      photo = Photo.create! valid_attributes
      expect {
        delete :destroy, params: {id: photo.to_param}, session: valid_session
      }.to change(Photo, :count).by(-1)
    end

    it "redirects to the photos list" do
      photo = Photo.create! valid_attributes
      delete :destroy, params: {id: photo.to_param}, session: valid_session
      expect(response).to redirect_to(root_url)
    end
  end

end
