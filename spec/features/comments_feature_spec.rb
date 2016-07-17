require 'rails_helper'

feature 'commenting' do
  scenario 'add a comment to a post' do
    create_post
    visit '/posts'
    click_link 'Comment'
    fill_in "Comment", with: 'Amazing'
    click_button 'Leave Comment'
    expect(page).to have_content 'Amazing'
  end
end
