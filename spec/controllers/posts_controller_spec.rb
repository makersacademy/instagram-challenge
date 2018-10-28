# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before :each do
    current_user = FactoryBot.create(:user)
    login_as(current_user, scope: :user)
  end

  describe 'GET /new ' do
    it 'responds with 302' do
      get :new
      expect(response).to have_http_status(302)
    end
  end

end
