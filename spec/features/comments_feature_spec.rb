require 'rails_helper'

feature 'commenting' do

  scenario 'allows users to add a comment using a form' do
    add_post
    visit '/photos'
    click_link 'Check out my sepia food'
    click_link 'Leave a comment'
    fill_in "Thoughts", with: 'Not very sepia really'
    click_button 'Leave comment'
    expect(current_path).to eq '/photos'
    expect(page).to have_content('Not very sepia really')
end

end
