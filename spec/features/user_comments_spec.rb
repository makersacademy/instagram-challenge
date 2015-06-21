require 'rails_helper'

feature 'A user cannot' do

  before do
    sign_up('test@test.com')
    add_picture
    add_comment('Nice cat')
    click_link 'Sign out'
    sign_up('test1@test.com')
    click_link 'Sign out'
  end

  scenario 'comment when logged out' do
    expect(page).not_to have_link 'Comment'
  end

  scenario 'delete a comment when logged out' do
    expect(page).not_to have_link 'Delete Comment'
  end

  scenario 'delete another users comment when logged in' do
    sign_in('test1@test.com')
    expect(page).not_to have_link 'Delete Comment'
  end

end

feature 'A logged in user' do

  before do
    sign_up('test@test.com')
    add_picture
    click_link 'Sign out'
    sign_up('test1@test.com')
    click_link 'Sign out'
  end

  scenario 'can comment on their own picture' do
    sign_in('test@test.com')
    add_comment('Nice cat')
    expect(page).to have_content 'Betty'
    expect(page).to have_content 'Nice cat'
  end

  scenario 'can comment on other peoples picture' do
    sign_in('test1@test.com')
    add_comment('Nah!')
    expect(page).to have_content 'Betty'
    expect(page).to have_content 'Nah!'
  end

  scenario 'can delete their own comment' do
    sign_in('test@test.com')
    add_comment('Nice cat!')
    click_link 'Delete comment'
    expect(page).not_to have_content 'Nah!'
  end

end