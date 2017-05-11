require 'rails_helper'

feature 'commenting' do
  before do
    sign_up
    add_picture
  end

  scenario 'allows users to comment on pictures using a form' do
    click_link 'Sign out'
    sign_up(email: 'philip@name.com')
    visit "/pictures/#{Picture.last.id}"
    click_link 'Comment'
    fill_in 'Thoughts', with: 'What a match this was!'
    click_button 'Add Comment'
    expect(current_path).to eq "/pictures/#{Picture.last.id}"
    expect(page).to have_content 'What a match this was!'
  end
end
