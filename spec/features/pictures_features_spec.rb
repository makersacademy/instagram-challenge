require 'rails_helper'

feature 'pictures' do

  context 'no pictures to begin' do

    scenario 'should display a prompt to add pictures' do
      visit '/pictures'
      expect(page).to have_content 'No pictures'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'adding pictures' do

    scenario 'should be able to add pictures' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file('Image', "#{Rails.root}/spec/support/uploads/derp.png")
      click_button 'Create Picture'
      expect(page).to have_xpath("//img[contains(@src,\"derp.png\")]")
    end
  end

end