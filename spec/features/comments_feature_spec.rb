require 'rails_helper'

feature 'commenting' do

  scenario 'allows users to leave a comment using a form' do
     sign_up
     create_post
     visit '/posts'
     click_link 'Sunny Day'
     click_link 'Comment on Sunny Day'
     fill_in "Thoughts", with: "Nice pic!"
     click_button 'Leave Comment'
     expect(current_path).to eq post_path(Post.last)
     expect(page).to have_content('At the park')
  end

  scenario 'deletes comments when post is deleted' do
    sign_up
    create_post
    visit '/posts'
    click_link('Sunny Day')
    click_link 'Comment on Sunny Day'
    fill_in 'Thoughts', with: 'Nice pic'
    click_button 'Leave Comment'
    click_link 'Delete Sunny Day'
    expect(page).not_to have_content('Nice pic')
  end

end
