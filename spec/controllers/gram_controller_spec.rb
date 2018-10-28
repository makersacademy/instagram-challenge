# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GramsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before :each do
    login_as(user, scope: :user)
  end

  describe 'GET #create' do
    it 'returns http 302' do
      allow_any_instance_of(GramsController).to receive(:current_user).and_return(user)
      get :create, params: { gram: { image: 'test.txt', caption: 6 } }
      expect(response).to have_http_status(302)
    end
  end
end
