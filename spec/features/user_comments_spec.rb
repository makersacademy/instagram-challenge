require 'rails_helper'

feature 'A logged in user can' do

  before do
    sign_up('test@test.com')
    add_picture('Betty')
    click_link 'Sign out'
    sign_up('test1@test.com')
    click_link 'Sign out'
    visit '/'
  end

  scenario 'comment on their own picture' do
    sign_in('test@test.com')
    click_link 'Comment'
    expect(page).to have_content 'Add a comment here:'
    fill_in 'comment_description', with: 'Nice cat!'
    click_button 'Create Comment'
    expect(page).to have_content 'Betty Nice cat!'
  end
end