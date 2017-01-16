require 'rails_helper'
require 'web_helpers'

feature 'commenting' do
  before do
    sign_up
    create_photo_post
  end

  scenario 'allows users to leave a comment using a form' do
    visit '/photos'
    click_link 'Comment on Test photo'
    fill_in "Thoughts", with: "Testing comments"
    click_button 'Leave Comment'
    expect(current_path).to eq '/photos'
    expect(page).to have_content('Testing comments')
  end

end
