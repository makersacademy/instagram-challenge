require 'rails_helper'

feature 'Liking photos' do
  background do
    visit '/'
    sign_up(username: 'allimac',email: 'camilla@email.com', password: 'pass1234')
    upload_photo
  end

  it 'a user is able to like a photo', js: true do
    find(".fa-heart-o").click
    sleep(1)
    expect(page).to have_content "1"
    expect(page).not_to have_css(".fa-heart-o")
    expect(page).to have_css(".fa-heart")
  end

  xit 'a user is not able to like a photo more than once', js: true do
    find(".fa-heart").click
    sleep(1)
    expect(page).to have_content "0"
    expect(page).not_to have_css(".fa-heart")
    expect(page).to have_css(".fa-heart-o")
  end

  xit 'a user can\'t like when logged out' do
    click_link 'allimac'
    click_link 'Log out'
    find(".fa-heart-o").click
    expect(current_path).to eq '/users/sign_in'
  end

end
