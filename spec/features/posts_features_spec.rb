require 'rails_helper'

feature 'creating posts with images' do
  scenario 'can upload an image and add a description' do
    sign_up
    click_link 'New Post'
    fill_in 'Description', with: 'Jonny Bravo'
    attach_file('post_image', "#{Dir.pwd}/spec/features/test_images/jonny.png")
    click_button 'Create Post'

    expect(page).to have_content 'Success'
    expect(page).to have_css('img')
    expect(current_path).to eq '/posts/1'
  end
end
