require 'rails_helper'

feature 'A logged in user' do

  before do
    sign_up('test@test.com')
    add_picture
    click_link 'Sign out'
    sign_up('test1@test.com')
    click_link 'Sign out'
  end

  scenario 'can only comment when logged in' do
    expect(page).not_to have_link 'Comment'
  end
  scenario 'can comment on their own picture' do
    sign_in('test@test.com')
    click_link 'Comment'
    expect(page).to have_content 'Add a comment here:'
    fill_in 'comment_description', with: 'Nice cat!'
    click_button 'Create Comment'
    expect(page).to have_content 'Betty Nice cat!'
  end
end