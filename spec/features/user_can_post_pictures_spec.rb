require 'rails_helper'

feature 'User can post pictures' do
  scenario 'a loged in user can post a picture' do
    user = User.create(full_name: 'Marius Brad', username: 'mbrad26', email: 'email@example.com', password: 'password')

    visit sessions_new_path

    fill_in :email, with: 'email@example.com'
    fill_in :password, with: 'password'
    click_button 'Sign In'

    expect(page).to have_content 'Pictures of the moment'
    fill_in "picture[title]", with: 'A house'
    fill_in "picture[description]", with: 'An amazing place'
    fill_in "picture[img_url]", with: 'https://live.staticflickr.com/5649/30407340951_1fd44ace0d_w.jpg'
    click_button 'Add picture'

    expect(current_path).to eq '/pictures'
    expect(page).to have_xpath "//img[contains(@src,'https://live.staticflickr.com/5649/30407340951_1fd44ace0d_w.jpg')]"
  end
end
