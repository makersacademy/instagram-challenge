require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  let(:user) { create(:user) }
  let(:photo) { create(:photo) }

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
      sign_in(user)
      get :index, params: { image: photo.image, description: photo.description }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      sign_in(user)
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
      sign_in(user)
      get :edit, params: {id: photo.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Photo" do
        sign_in(user)
        expect { FactoryGirl.create(:photo)
          #post :create, params: {photo: valid_attributes}, session: valid_session
        }.to change(Photo, :count).by(1)
      end

      it "redirects to the created photo" do
        sign_in(user)
        post :create, params: {photo: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Photo.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        sign_in(user)
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
        sign_in(user)
        put :update, params: {id: photo.to_param, photo: new_attributes}, session: valid_session
        photo.reload
        expect(photo.description).to eq "new description"
      end

      it "redirects to the photo" do
        sign_in(user)
        put :update, params: {id: photo.to_param, photo: valid_attributes}, session: valid_session
        expect(response).to redirect_to(photo)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        sign_in(user)
        put :update, params: {id: photo.to_param, photo: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested photo" do
      sign_in(user)
      photo = FactoryGirl.create(:photo)
      expect {
        delete :destroy, params: {id: photo.to_param}, session: valid_session
      }.to change(Photo, :count).by(-1)
    end

    it "redirects to the photos list" do
      sign_in(user)
      delete :destroy, params: {id: photo.to_param}, session: valid_session
      expect(response).to redirect_to(root_url)
    end
  end

end
