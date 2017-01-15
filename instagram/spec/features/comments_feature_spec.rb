require 'rails_helper'

feature 'commenting' do
  before do
    sign_up
    post_photo
  end
  scenario 'allows users to post comments on photos using a form' do
    visit '/photos'
    click_link 'My Lunch'
    click_link 'Comment'
    fill_in 'Thoughts', with: 'Looks disgusting'
    click_button 'Post'
    expect(current_path).to eq '/photos'
    expect(page).to have_content 'Looks disgusting'
  end


end
