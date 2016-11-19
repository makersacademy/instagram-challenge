require 'rails_helper'

feature 'Create a comment' do
  scenario 'can comment on a post' do
    click_link 'Register'
    fill_in 'User name', with: 'Laurent'
    fill_in 'Email', with: 'laurent@makers.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    visit '/'
    fill_in 'Comment', with: 'beautiful pic'
    click_button 'Submit'
    expect(page).to have_css("div.comments#{post.id}", text: 'beautiful pic')
  end
end
