require 'rails_helper'

feature 'commenting' do
  before {Picture.create name: 'Holiday'}

  scenario 'allows users to leave a comment using a form' do
    visit '/pictures'
    click_link 'Comment Holiday'
    fill_in "Comment", with: "Looks nice"
    click_button 'Leave Comment'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content('Looks nice')
  end

end