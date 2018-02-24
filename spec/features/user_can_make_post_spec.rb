require 'spec_helper.rb'
require 'rails_helper.rb'

feature 'User account' do
  scenario 'user can sign up for account' do
    #sign up
    visit '/'
    click_link 'Login'
    click_link 'Sign up'
    fill_in 'Username', with: 'satoshi'
    fill_in 'Email', with: 'sam@msn.com'
    fill_in 'Password', with: 'capybara'
    fill_in 'Password confirmation', with: 'capybara'
    click_button 'Sign up'
    #create post
    click_link 'New Post'
    fill_in 'Caption', with: 'my first post on vanity '
    fill_in 'Image', with: 'selfie.jpg'
    click_button 'Upload'
    expect(page).to have_content('my first post on vanity')
  end
end
