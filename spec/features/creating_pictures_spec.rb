require 'rails_helper.rb'

feature 'Create new picture post' do
  scenario 'can create a picture post' do
    visit '/'
    click_link 'Post Picture'
    # image source: https://pixabay.com/photos/road-forest-season-autumn-fall-1072823/
    attach_file('Image', "./spec/files/images/road-1072823_1280.jpg")
    fill_in 'Caption', with: 'Autumn colours are so pretty' 
    click_button 'Create Post'
    expect(page).to have_content('Autumn colours are so pretty')
    expect(page).to have_css("img[src*='road-1072823_1280.jpg']")
  end
end
