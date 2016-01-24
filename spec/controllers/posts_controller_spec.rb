require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it { is_expected.to use_before_action(:authenticate_user!) }

  describe 'GET #index' do
    let!(:post) { FactoryGirl.create(:post) }
    before { get :index }

    it { is_expected.to render_template 'index' }

    it 'assigns @posts' do
      expect(assigns :posts).to eq [post]
    end
  end

  describe 'GET #new' do
    login_user
    before { get :new }

    it { is_expected.to render_template 'new'}

    it 'assigns a new Post to @post' do
      expect(assigns :post).to be_a_new(Post)
    end
  end

  describe 'GET #show' do
    let!(:post) { FactoryGirl.create(:post) }
    before { get :show, id: post.id }

    it { is_expected.to render_template 'show' }

    it 'assigns @post' do
      expect(assigns :post).to eq post
    end
  end

  describe 'POST #create' do
    login_user

    context 'with valid attributes' do
      it 'creates a new post' do
        expect do
          post :create, post: FactoryGirl.attributes_for(:post_params)
        end.to change(Post, :count).by(1)
      end

      it 'redirects to the posts path' do
        post :create, post: FactoryGirl.attributes_for(:post_params)
        expect(response).to redirect_to posts_path
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with valid user' do
      let!(:user) { FactoryGirl.create(:user) }
      let!(:post) { FactoryGirl.create(:post, user: user) }
      before(:each) { sign_in user }

      it 'deletes the post' do
        expect do
          delete :destroy, id: post
        end.to change(Post, :count).by(-1)
      end

      it do
        delete :destroy, id: post
        is_expected.to set_flash[:success].to 'Post deleted successfully'
      end

      it 'redirects to posts path' do
        delete :destroy, id: post
        expect(response).to redirect_to posts_path
      end
    end

    context 'with invalid user' do
      let!(:user) { FactoryGirl.create(:user) }
      let!(:post) { FactoryGirl.create(:post) }
      before(:each) { sign_in user }

      it 'does not delete the post' do
        expect do
          delete :destroy, id: post
        end.not_to change(Post, :count)
      end

      it do
        delete :destroy, id: post
        is_expected.to set_flash[:error].to 'Only the owner can delete a post'
      end

      it 'redirects to posts path' do
        delete :destroy, id: post
        expect(response).to redirect_to posts_path
      end
    end
  end
end
