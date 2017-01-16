require 'rails_helper'

feature 'commenting' do

  before do
    sign_up
    post_photo
    click_link 'image'
    click_link 'Comment'
  end

  scenario 'allows users to post comments on photos using a form' do
    fill_in 'Thoughts', with: 'Looks disgusting'
    click_button 'Post'
    expect(current_path).to eq '/photos'
    expect(page).to have_content 'Looks disgusting'
  end

  scenario 'cannot post an empty comment' do
    click_button 'Post'
    expect(page).to have_content 'Thoughts'
  end
end
