require 'rails_helper'

feature 'Adding comments' do
  before { Picture.create description: 'berries' }

  scenario 'allows users to leave a comment using a form' do
    visit '/pictures'
    click_link 'Comment on picture'
    fill_in "Comments", with: "Great picture!"
    click_button 'Leave Comment'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content('Great picture!')
  end
end
