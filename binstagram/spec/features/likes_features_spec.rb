require 'rails_helper'
require_relative 'helpers/session'
include SessionHelpers

feature 'liking a photo' do
  
  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testpassword')
    fill_in('Password confirmation', with: 'testpassword')
    click_button('Sign up')
    add_photo('Dumpster', 'Industrial bin in blue with 4 multi-directional wheels.')
  end

  scenario 'a user can like a photo, which increments the photo likes count', js: true do
    
    visit '/photos'
    click_link 'Like Dumpster'
    expect(page).to have_content('1 likes')
  end
end

