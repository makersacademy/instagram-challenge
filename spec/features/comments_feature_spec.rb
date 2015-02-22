require 'rails_helper'

feature 'comments' do
  before { Post.create description: 'Awesome latte' }

  scenario 'allows user to leave a comment' do
    sign_up('test@test.com', 'testtest', 'testtest')
    click_link 'Write a comment'
    fill_in 'Thoughts', with: 'Great picture'
    click_button 'Comment'
    expect(page).to have_content 'Great picture'
    expect(current_path).to eq '/posts'
  end

  scenario 'prevents a user leaving a comment if they are not signed in' do
    visit '/'
    click_link 'Write a comment'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'an invalid comment' do
    sign_up('test@test.com', 'testtest', 'testtest')
    click_link 'Write a comment'
    fill_in 'Thoughts', with: 'XY'
    click_button 'Comment'
    expect(page).not_to have_css 'li', text: 'XY'
    expect(page).to have_content 'error'
  end

end

def sign_up(email, password, password_confirmation)
  visit '/users/sign_up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end