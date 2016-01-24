require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  it { is_expected.to use_before_action(:authenticate_user!) }
  let!(:post_) { FactoryGirl.create(:post) }

  describe 'POST #create' do
    login_user

    context 'with valid attributes' do
      it 'creates a new like' do
        expect do
          post :create, post_id: post_
        end.to change(Like, :count).by(1)
      end

      it 'redirects to the posts path' do
        post :create, post_id: post_
        expect(response).to redirect_to posts_path
      end
    end
  end
end
