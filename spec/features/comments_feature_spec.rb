require 'rails_helper'

feature 'comments' do
  before(:each) do
    visit '/images'
    click_link 'Add an Image'
    fill_in 'Name', with: 'breakfast'
    page.attach_file 'image[image]', 'spec/assets/images/dom-s-eatery.jpg'
    click_button 'Create Image'
  end
  scenario 'Allows a user to leave a comment with a form' do
    visit '/images'
    click_link 'Add a comment'
    fill_in "Thoughts", with: "Awesome Picture"
    click_button 'Create Comment'
    expect(page).to have_content('Awesome Picture')
    expect(current_path).to eq('/images')
  end
end
