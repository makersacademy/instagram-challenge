require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  it { is_expected.to use_before_action(:authenticate_user!) }

  let!(:post_) { FactoryGirl.create(:post) }

  describe 'GET #new' do
    login_user
    before { get :new, post_id: post_ }

    it { is_expected.to render_template 'new'}

    it 'assigns the post to @post' do
      expect(assigns :post).to eq post_
    end

    it 'assigns a new Comment to @comment' do
      expect(assigns :comment).to be_a_new(Comment)
    end
  end

  describe 'GET #edit' do

  end

  describe 'POST #create' do
    login_user

    context 'with valid attributes' do
      it 'creates a new comment' do
        expect do
          post :create,
            post_id: post_,
            comment: FactoryGirl.attributes_for(:comment_params)
        end.to change(Comment, :count).by(1)
      end

      it 'redirects to the post path' do
        post :create,
          post_id: post_,
          comment: FactoryGirl.attributes_for(:comment_params)
        expect(response).to redirect_to post_path(post_)
      end
    end

    context 'with invalid attributes' do
    end
  end

  describe 'PUT #update' do

  end

  describe 'DELETE #destroy' do

  end
end
