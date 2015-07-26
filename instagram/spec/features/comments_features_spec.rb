require 'rails_helper'
require 'helpers'

feature 'Adding comments' do
  before { Picture.create description: 'berries' }

  scenario 'only logged in users are able to leave a comment using a form' do
    sign_up
    click_link 'Comment on picture'
    fill_in "Comments", with: "Great picture!"
    click_button 'Leave Comment'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content('Great picture!')
  end

  scenario 'for users not logged in, redirected to index when attempting to add comment' do
    visit '/pictures'
    click_link 'Comment on picture'
    expect(current_path).to eq ('/users/sign_in')
  end



end
