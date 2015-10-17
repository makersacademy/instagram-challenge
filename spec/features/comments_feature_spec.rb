require 'rails_helper'

feature 'comments' do


  scenario 'user must be logged in to create a post' do
    sign_in
    make_post_sign_out
    visit '/posts'
    click_link 'Comment'
    expect(page).not_to have_content 'Leave Comment'
    expect(current_path).to eq '/users/sign_in'
  end

  scenario 'allows users to leave a comment' do
   post = Post.create(content: 'hey')
   sign_in
   visit '/posts'
   click_link 'Comment'
   fill_in "Content", with: "hey yourself"
   click_button 'Leave Comment'
   expect(current_path).to eq '/posts'
   expect(page).to have_content('hey yourself')
  end

end
