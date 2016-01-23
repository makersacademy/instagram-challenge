require 'rails_helper'

feature 'Pictures' do
  # As a user
  # So that I can use Instagram
  # I would like to post pictures on it

  context 'no pictures have been posted' do
    scenario 'should show a button to post a picture' do
      visit '/pictures'
      expect(page).to have_button('Post a picture')
    end
  end

  context 'pictures have been posted' do
    scenario 'allows user to upload a picture' do
      visit '/pictures'
      fill_in 'Description', with: 'My first picture!'
      page.attach_file('Image', Rails.root + 'spec/factories/test.jpg')
      expect(attach_file('Image', 'spec/factories/test.jpg')).to be_truthy
    end 

    scenario 'pictures can be viewed' do
      visit '/pictures'
      fill_in 'Description', with: 'My first picture!'
      page.attach_file('Image', Rails.root + 'spec/factories/test.jpg')
      click_button 'Post'
      expect(page).to have_xpath("//img[contains(@src, \"thumb/test.jpg\")]")
    end
  end
end
