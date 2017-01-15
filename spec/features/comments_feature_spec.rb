require 'rails_helper'

feature 'comments' do

  before do
    sign_up
    add_post
  end

  scenario 'allow users to leave comments using a form' do
    visit '/posts'
    click_link 'image'
    click_link 'Comment'
    fill_in 'Comments', with: 'Nice!'
    click_button 'Comment'
    expect(page).to have_content 'Nice!'
  end

  scenario 'user can only delete their own comments' do
    visit '/posts'
    click_link 'image'
    click_link 'Comment'
    fill_in 'Comments', with: 'Nice!'
    click_button 'Comment'
    click_link 'Sign out'
    sign_up2
    visit '/posts'
    click_link 'image'
    expect(page).not_to have_link 'Delete comment'
  end
end
