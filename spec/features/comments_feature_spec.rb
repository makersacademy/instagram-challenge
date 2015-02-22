require 'rails_helper'

feature 'comments' do

  before do
    Post.create(title: 'Holidays')
  end

  scenario 'does not allow not logged in user to leave a comment on a post' do
    visit '/posts'
    click_link 'Comment it'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
    expect(current_path).to eq '/users/sign_in'
  end

  scenario 'allows logged in user to leave a comment on a post' do
    visit '/posts'
    sign_up
    click_link 'Comment it'
    fill_in 'Comment', with: 'Wonderful place'
    click_button 'Comment it!'
    expect(current_path).to eq '/posts'
    expect(page).to have_content 'Wonderful place'
  end

  def sign_up
    click_link 'Sign up'
    fill_in 'Email', with: 'my@email.com'
    fill_in 'Password', with: 'testtest'
    fill_in 'Password confirmation', with: 'testtest'
    click_button 'Sign up'
  end

end