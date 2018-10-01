require 'spec_helper'

RSpec.feature 'Upload Picture', type: :feature do
  before(:each) do
    user_params = {first_name: 'Tess', 
                   last_name: 'Tester', 
                   email: 'tess@tester.com', 
                   password: 'secure'}
    User.create(user_params)
    visit '/welcome/home'
    click_link 'Sign in'
    fill_in 'session_email', with: 'tess@tester.com'
    fill_in 'session_password', with: 'secure'
    click_button 'Log In'
  end

  scenario 'user uploads picture' do
    visit '/welcome/images'
    attach_file('photo_upload', Rails.root + 'spec/fixtures/test_upload.png')
    click_button 'Upload'
    expect(page).to have_css("img[src*='environ-peeling-kuur.jpg']")
  end
end
