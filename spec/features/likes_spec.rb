require 'rails_helper'

feature 'Liking photos' do
  background do
    visit '/'
    sign_up(username: 'allimac',email: 'camilla@email.com', password: 'pass1234')
    upload_photo
  end

  scenario 'a user is able to like a photo just once', js: true do
    find(".fa-heart-o").click
    expect(page).to have_content "1 like"
    expect(page).not_to have_css(".fa-heart-o")
    expect(page).to have_css(".fa-heart")
  end

end
