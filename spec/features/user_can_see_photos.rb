require 'rails_helper'

RSpec.feature "Photos",  type: :feature do

  scenario "can see a photo on the front page after upload", type: :feature do
    sign_up
    click_on "Upload Photo"
    fill_in 'photo_title', with: 'My Cool Photo'
    page.attach_file('photo_image', Rails.root + 'app/assets/images/photo.jpg')
    click_on 'Submit'
    expect(page).to have_content 'My Cool Photo'
  end
  
end
