require 'rails_helper'

feature 'commenting' do
  scenario 'allows users to leave a comment' do
    sign_up
    create_post
    click_link 'PIC'
    click_link 'Leave a Comment'
    fill_in "Comments", with: "Meh"
    click_button 'Leave Comment'
    expect(page).to have_content('Meh')
  end
end
