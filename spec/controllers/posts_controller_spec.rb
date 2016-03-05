require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  context 'creating a post' do

    login_user

    before :each do
        get :new
    end

    it 'successfully creates a post' do
      expect do
        post :create, post: FactoryGirl.attributes_for(:post_params)
      end.to change(Post, :count).by(1)

    end

  end

end
