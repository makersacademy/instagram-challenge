require 'rails_helper'

feature 'creating posts with images' do
  scenario 'can upload an image and add a description to it' do
    sign_up
    click_link 'New Post'
    fill_in 'Description', with: 'Jonny Bravo'
    attach_file('post_image', "#{Dir.pwd}/spec/features/test_images/jonny.png")
    click_button 'Create Post'
    expect(page).to have_content 'Jonny Bravo'
    expect(page).to have_content 'Success'
  end
end
