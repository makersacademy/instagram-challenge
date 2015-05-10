require 'rails_helper'

feature 'Leaving a comment' do

  scenario 'doesnt allow visitors to comment' do
    post = Post.create(content: 'its a post', name: 'Poast')
    visit '/posts'
    click_link "Poast"
    click_link "comment on post"
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
  context 'sign up, make post' do
    
    before(:each) do
      sign_up
      make_post
      visit '/posts'
      click_link "Poast"
      click_link "comment on post"
      fill_in :Thoughts, with: "Yeah buddy!!!"
      click_button 'leave comment'
    end
    
    scenario 'allows users to leave a comment' do
      expect(current_path).to eq '/posts'
      expect(page).to have_content "Yeah buddy!!!"
    end

    scenario 'when parent post is destroyed, child comments are destroyed as well' do
      click_link "Poast"
      click_link "delete post"
      expect(page).not_to have_content("Yeah buddy!!!")
    end

    scenario 'a comment can be deleted' do
      click_link "Poast"
      click_link "delete comment"
      expect(current_path).to eq '/posts'
      expect(page).to have_content('comment deleted successfully')
      click_link "Poast"
      expect(page).not_to have_content("Yeah buddy!!!")
    end

    scenario 'a comment can only be deleted by the author' do
      click_link 'Sign out'
      sign_up 'differentuser@test.com'
      click_link "Poast"
      click_link "delete comment"
      expect(page).not_to have_content('comment deleted successfully')
      expect(page).to have_content('Only the author can delete comments')
    end
  end
end