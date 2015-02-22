require 'rails_helper'

feature 'liking' do
  before { Post.create description: 'Awesome latte' }

  scenario 'allows a user to like a post' do
    sign_up('test@test.com', 'testtest', 'testtest')
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

  scenario 'prevents a user liking a post unless they are signed in' do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

end

def sign_up(email, password, password_confirmation)
  visit '/users/sign_up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end