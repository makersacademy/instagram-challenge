require 'rails_helper'
require_relative 'helpers/session'
include SessionHelpers

feature 'commenting' do

  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testpassword')
    fill_in('Password confirmation', with: 'testpassword')
    click_button('Sign up')
    add_photo('Dumpster', 'Industrial bin in blue with 4 multi-directional wheels.')
  end

  scenario 'allows users to leave a comment using a form' do
    
    visit '/photos'
    click_link 'Comment on Dumpster'
    fill_in 'Thoughts', with: 'so so'
    click_button 'Leave Comment'

    expect(current_path).to eq '/photos'
    expect(page).to have_content('so so')
  end
end