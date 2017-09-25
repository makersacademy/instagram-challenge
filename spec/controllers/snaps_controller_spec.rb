require 'rails_helper'
require_relative '../support/features/clearance_helpers'
require 'support/features/clearance_helpers'

RSpec.describe SnapsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Snap. As you add validations to Snap, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SnapsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    before(:each) do
      # sign_in
    end

    it 'returns a success response' do
      snap = Snap.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      snap = Snap.create! valid_attributes
      get :show, params: { id: snap.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      snap = Snap.create! valid_attributes
      get :edit, params: { id: snap.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Snap' do
        expect do
          post :create, params: { snap: valid_attributes }, session: valid_session
        end.to change(Snap, :count).by(1)
      end

      it 'redirects to the created snap' do
        post :create, params: { snap: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Snap.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { snap: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested snap' do
        snap = Snap.create! valid_attributes
        put :update, params: { id: snap.to_param, snap: new_attributes }, session: valid_session
        snap.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the snap' do
        snap = Snap.create! valid_attributes
        put :update, params: { id: snap.to_param, snap: valid_attributes }, session: valid_session
        expect(response).to redirect_to(snap)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        snap = Snap.create! valid_attributes
        put :update, params: { id: snap.to_param, snap: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested snap' do
      snap = Snap.create! valid_attributes
      expect do
        delete :destroy, params: { id: snap.to_param }, session: valid_session
      end.to change(Snap, :count).by(-1)
    end

    it 'redirects to the snaps list' do
      snap = Snap.create! valid_attributes
      delete :destroy, params: { id: snap.to_param }, session: valid_session
      expect(response).to redirect_to(snaps_url)
    end
  end
end
