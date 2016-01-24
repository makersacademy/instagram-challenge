require 'rails_helper'

RSpec.describe PostsController do
  it { is_expected.to use_before_action(:authenticate_user!) }
  login_user

  describe 'GET #index' do
    let!(:post) { FactoryGirl.create(:post) }
    before { get :index }

    it { is_expected.to render_template 'index' }

    it 'assigns @posts' do
      expect(assigns :posts).to eq [post]
    end
  end

  describe 'GET #new' do
    before { get :new }

    it { is_expected.to render_template 'new'}

    it 'assigns a new Post to @post' do
      expect(assigns :post).to be_a_new(Post)
    end
  end

  describe 'POST #create' do
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

    context 'with invalid attributes' do

    end
  end
end
