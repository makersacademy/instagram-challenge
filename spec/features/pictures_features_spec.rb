require 'rails_helper'
require_relative '../helpers/helper_methods.rb'

feature 'pictures' do

  context 'no pictures to begin' do

    scenario 'should display a prompt to add pictures' do
      sign_in
      visit '/pictures'
      expect(page).to have_content 'No pictures'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'adding pictures' do

    scenario 'should be able to add pictures' do
      sign_in
      add_picture
      expect(page).to have_xpath("//img[contains(@src,\"derp.png\")]")
    end
  end

  context 'deleting pictures' do

    scenario 'should be able to delete pictures' do
      sign_in
      add_picture
      click_link 'Delete'
      expect(page).not_to have_xpath("//img[contains(@src,\"derp.png\")]")
    end
  end

end