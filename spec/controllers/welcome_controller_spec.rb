# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  pending describe 'index' do
    it 'should return 202 status' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
