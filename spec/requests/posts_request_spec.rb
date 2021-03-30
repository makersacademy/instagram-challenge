require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  it 'redirects to user sign in when not logged in' do
    get('/')
    expect(response).to redirect_to('/users/sign_in')
  end
end
