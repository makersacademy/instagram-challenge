require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe '#index' do
    it 'responds with success' do
      get :index
      expect(response).to be_success
    end
  end

  describe '#new' do
    it 'responds with success' do
      get :new
      expect(response).to be_success
    end
  end
end
