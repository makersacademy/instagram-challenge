require 'rails_helper'

feature 'adding comments' do

  scenario 'allows users to add a comment using a form' do
     signup
     create_post
     visit '/'
     click_link 'Add comment'
     fill_in "Comment", with: "a new comment"
     click_button 'Leave comment'
     expect(current_path).to eq '/posts'
     expect(page).to have_content('a new comment')
  end

  scenario 'can not add a comment if not signed in' do
    visit '/'
    expect(page).to_not have_content('Leave comment')
  end

end
