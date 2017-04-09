require 'rails_helper'

feature 'pictures' do
  context 'no pictures exist' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'adding pictures with location' do
    scenario 'user can add a picture and see it on the home page with address information' do
      visit '/'
      click_link 'Post a picture'
      attach_file('picture[image]', File.absolute_path('./spec/test_images/cat.jpg'))
      click_button 'Create Picture'
      expect(page).to have_css("img[@alt=Cat]")
      expect(page).to have_content("Newark Rd, Lincoln LN6 9JP, UK")
    end
  end

  context 'adding pictures without location' do
    scenario 'user can add a picture and see it on the home page with address information' do
      visit '/'
      click_link 'Post a picture'
      attach_file('picture[image]', File.absolute_path('./spec/test_images/cat_no_gps.jpg'))
      click_button 'Create Picture'
      expect(page).to have_css("img[@alt='Cat no gps']")
    end
  end


end
