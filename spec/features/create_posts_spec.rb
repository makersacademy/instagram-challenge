require 'rails_helper'

feature 'Creating posts works' do
  background do
    visit '/'
    click_link 'Register'
    fill_in 'User name', with: 'johndoe'
    fill_in 'Email', with: 'johndoe@internet.com'
    fill_in 'Password', with: 'testtest', match: :first
    fill_in 'Password confirmation', with: 'testtest'
    click_button 'Sign up'
    click_link 'New Post'
  end

  scenario 'via form that provides image and caption' do
    attach_file('Image', "spec/files/images/sample_01.jpg")
    fill_in 'Caption', with: 'birdy birdy nomnom'
    click_button 'Create Post'
    expect(page).to have_content('nomnom')
    expect(page).to have_css("img[src*='sample_01.jpg']")
  end

  scenario 'and image is compulsory.' do
    fill_in 'Caption', with: "This is a no-image post."
    click_button 'Create Post'
    expect(page).to have_content('Nope. Nope. You must provide an image!')
  end
end
