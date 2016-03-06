require 'rails_helper'

feature 'Commenting on posts' do
  before do
    sign_up
    make_a_post
    sign_out
    sign_up('commenter@email.com')
  end

  scenario 'users can make comments on posts' do
    click_link 'Comment'
    fill_in 'Content', with: 'This is a comment'
    click_button 'Post'
    within('li.comments') do
      expect(page).to have_content 'commenter@email.com'
      expect(page).to have_content 'This is a comment'
    end
  end

  scenario 'user needs to be signed in to comment' do
    sign_out
    click_link 'Comment'
    expect(page).not_to have_button('Post')
    expect(page).to have_content('Log in')
  end
end
