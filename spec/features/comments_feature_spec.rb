require 'rails_helper'

feature 'comments' do
  
  scenario 'allow users to leave a comment using a form' do
    create_post
    visit '/posts'
    click_link 'Add a comment'
    fill_in "Thoughts", with: 'Super cute!'
    click_button 'Leave Comment'

    expect(current_path).to eq '/posts'
    expect(page).to have_content 'Super cute!'
  end
end