require 'rails_helper'
require_relative 'helpers/session_helpers'
include SessionHelpers

feature 'Comments' do

  before do
    sign_up('test@test.com', '11111111', '11111111')
    attach_picture
  end

  scenario 'no comments added when picture uploaded' do
   expect(page).to have_content 'No comments yet'
 end

  scenario 'user have to be signed in to leave a comment' do
    click_link 'Sign out'
    expect(page).not_to have_content 'Comment picture'
  end

  scenario 'only signed in user can leave a comment under the picture' do
    click_link 'Comment picture'
    fill_in 'Thoughts', with: 'What an amazing picture'
    click_button 'Leave comment'
    expect(page).to have_content 'What an amazing picture'
    expect(page).to have_content 'test@test.com'
  end

  scenario 'email is attached to the comment' do
    click_link 'Sign out'
    sign_up('bob@bob.com', '22222222', '22222222')
    click_link 'Comment picture'
    fill_in 'Thoughts', with: 'What an amazing picture'
    click_button 'Leave comment'
    expect(page).to have_content 'What an amazing picture'
    expect(page).to have_content 'bob@bob.com'
  end
end