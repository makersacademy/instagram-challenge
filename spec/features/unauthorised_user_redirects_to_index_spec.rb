require 'rails_helper'
include HomeHelper

RSpec.feature 'unauthorised user cannot see feed' do
  scenario 'gets redirected to homepage' do
    visit('/images')
    expect(current_path).to eq('/')
    expect(page).to have_content('Welcome, Stranger')
  end
end
