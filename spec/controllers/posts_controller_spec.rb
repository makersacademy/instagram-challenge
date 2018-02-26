require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  before do
    user = User.create email: 'test@gmail.com', password: '12345678', password_confirmation: '12345678'
    login_as user
  end

  let(:post1) { create(:post) }

  describe "GET#index" do
    it 'populates an array of posts' do
      get :index
      expect(assigns(:posts)).to eq([post1])
    end
    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET#show" do
    it 'should show post' do
      get :show, params: { id: post1.id }
      expect(response.status).to eq(200)
    end
    it 'renders the :show view' do
      get :show, params: { id: post1.id }
      expect(response).to render_template :show
    end
  end

  describe "Get#new" do
    it 'renders the :form view' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context 'valid post created' do
      it 'creates a new post' do
        params = attributes_for(:post)
        expect {
          post :create, params: { post: params }
          }.to change(Post, :count).by(1)
      end
    end

    context 'invalid post created' do
      it 'does not save new post' do
        params = { :comment=>"My Fave Cat", :avatar=> nil }
        expect {
          post :create, params: { post: params }
        }.not_to change(Post, :count)
        end

        it 'renders new form to page' do
          params = { :comment=>"My Fave Cat", :avatar=> nil }
          post :create, params: { post: params }
          expect(response).to render_template :new
        end
      end
    end

    describe 'DELETE destroy' do
      it "deletes the post" do
        post = create(:post)
        expect{
          delete :destroy, params: { id: post.id }
        }.to change(Post,:count).by(-1)
      end
      it "redirects to contacts#index" do
        delete :destroy, params: { id: post1.id }
        expect(response).to redirect_to posts_url
      end
    end
end
