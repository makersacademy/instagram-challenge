require 'web_helpers.rb'
require 'rails_helper.rb'

RSpec.feature 'User Profile', type: :feature do

  # before do
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.new(id: 1))
  # end

  scenario 'all user posts displayed on profile page' do
    visit '/'
    click_link 'Sign up'
    fill_in 'user_email', with: 'profile@test.com'
    fill_in 'user_password', with: 'test123'
    fill_in 'user_password_confirmation', with: 'test123'
    click_button'Sign up'
    new_post_steps
    visit '/'
    click_link 'New Post'
    attach_file('Image', "files/images/hairlessjeffcat.jpg")
    fill_in 'Caption', with: 'Oh my God its Jeff and a hairless cat'
    click_button 'Create Post'
    click_link 'Currently logged in as profile@test.com'
    expect(page).to have_content('Goldblum dog')
    expect(page).to have_css("img[src*='goldblumdog.jpg']")
    expect(page).to have_content('Oh my God its Jeff and a hairless cat')
    expect(page).to have_css("img[src*='hairlessjeffcat.jpg']")
  end
end
