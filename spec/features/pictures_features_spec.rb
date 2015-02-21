require 'rails_helper'

feature 'pictures' do

  def add_picture
    visit '/pictures'
    click_link 'Add a picture'
    attach_file('Image', "#{Rails.root}/spec/support/uploads/derp.png")
    click_button 'Create Picture'
  end 

  context 'no pictures to begin' do

    scenario 'should display a prompt to add pictures' do
      visit '/pictures'
      expect(page).to have_content 'No pictures'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'adding pictures' do

    scenario 'should be able to add pictures' do
      add_picture
      expect(page).to have_xpath("//img[contains(@src,\"derp.png\")]")
    end
  end

  context 'deleting pictures' do

    scenario 'should be able to delete pictures' do
      add_picture
      click_link 'Delete'
      expect(page).not_to have_xpath("//img[contains(@src,\"derp.png\")]")
    end
  end

end