require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:post) { FactoryGirl.create(:post) }

  describe 'GET #new' do
    login_user
    before { get :new, post_id: post }

    it { is_expected.to render_template 'new'}

    it 'assigns the post to @post' do
      expect(assigns :post).to eq post
    end

    it 'assigns a new Comment to @comment' do
      expect(assigns :comment).to be_a_new(Comment)
    end
  end

  describe 'GET #edit' do

  end

  describe 'POST #create' do

  end

  describe 'PUT #update' do

  end

  describe 'DELETE #destroy' do

  end
end
