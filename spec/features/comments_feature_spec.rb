require 'rails_helper'

feature 'Commenting' do
  before do
    User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  scenario 'User can leave a comment using a form' do
    user = User.first
    user.posts.create(image: File.new(Rails.root + 'spec/fixtures/images/freedom-beach.jpg'), caption: 'Cool')
    visit root_path
    visit "posts/#{user.posts.last.id}"
    click_link 'Comment'
    fill_in 'comment_text', with: 'cool pic'
    click_button 'Comment'
    visit "posts/#{user.posts.first.id}"
    expect(page).to have_content 'cool pic'
  end
end
