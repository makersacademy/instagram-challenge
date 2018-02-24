require 'spec_helper.rb'
require 'rails_helper.rb'

feature 'User posts' do
  pending scenario 'user can create a post with image and caption' do
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
    attach_file('Image', Rails.root + 'spec/fixtures/apple-touch-icon.png', make_visible: true)
    click_button 'Upload'
    expect(page).to have_content('my first post on vanity')
  end
end
