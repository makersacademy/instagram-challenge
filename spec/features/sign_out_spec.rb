require 'rails_helper'
include HomeHelper

RSpec.feature 'user can sign out' do
  scenario 'and gets redirected to the homepage' do
    sign_out
    expect(current_path).to eq('/')
    expect(page).to have_content('Signed out successfully.')
  end
end
