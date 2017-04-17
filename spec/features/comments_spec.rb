require 'rails_helper'
include UsersHelper
include PhotosHelper

feature 'commenting' do
  before {  user = build :user
            sign_up user
            create_photo }

  scenario 'allows users to leave a comment on a photo' do
     click_link 'Comment on this photo'
     fill_in "Comment", with: "Awesome!"
     click_button 'Leave Comment'
     expect(current_path).to eq '/photos'
     expect(page).to have_content('Awesome!')
  end

  scenario 'users can only delete comments that they have made' do
    click_link 'Comment on this photo'
    fill_in "Comment", with: "AMAZING!"
    click_button 'Leave Comment'
    expect(page).to have_link('Delete Comment')
    click_link "Sign out"
    expect(page).not_to have_link 'Delete Comment'
  end

end
