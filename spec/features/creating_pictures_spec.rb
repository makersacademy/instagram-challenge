require 'rails_helper.rb'

feature 'Create new picture post' do
  scenario 'can create a picture post' do
    visit '/'
    click_link('camera_alt')

    # image source: https://pixabay.com/photos/road-forest-season-autumn-fall-1072823/

    attach_file('Image', "./spec/files/images/road-1072823_1280.jpg")

    # page.attach_file 'picture_image', "#{Rails.root}/spec/files/images/road-1072823_1280.jpg"

    # expect(page).to have_content('Upload a new photo!')

    fill_in 'Caption', with: 'Autumn colours are so pretty'
    click_button 'Create Picture Post'
    expect(page).to have_content('Autumn colours are so pretty')
    expect(page).to have_css("img[src*='road-1072823_1280.jpg']")
  end
end
