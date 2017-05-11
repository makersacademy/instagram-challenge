require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    scenario 'display pictures' do
      sign_up
      add_picture
      expect(page).to have_xpath("//img[contains(@src,'http://68.media.tumblr.com/9150621cddccbc705a6805d15b835767/tumblr_mrhvg5sMPz1r1thfzo1_1280.jpg')]")
      expect(page).not_to have_content 'No pictures yet'
    end
  end

  context 'adding pictures' do
    scenario 'prompts user to fill out a form, then displays the new picture' do
      sign_up
      add_picture
      expect(page).to have_xpath("//img[contains(@src,'http://68.media.tumblr.com/9150621cddccbc705a6805d15b835767/tumblr_mrhvg5sMPz1r1thfzo1_1280.jpg')]")
      expect(current_path).to eq '/pictures'
    end

    scenario 'restricted if user not logged in' do
      visit '/pictures'
      click_link 'Add a picture'
      expect(current_path).to eq '/users/sign_in'
    end
  end

  context 'viewing pictures' do
    scenario 'lets a user view a picture' do
      sign_up
      add_picture
      visit "/pictures/#{Picture.last.id}"
      expect(page).to have_content 'Just a fan enjoying the game'
    end
  end

  context 'deleting pictures' do
    before do
      sign_up
      add_picture
    end

    scenario 'remove a picture when a user clicks the delete link' do
      visit "/pictures/#{Picture.last.id}"
      click_link 'Delete'
      expect(page).not_to have_content 'Just a fan enjoying the game'
      expect(page).to have_content 'Picture deleted successfully'
    end

    scenario 'cannot delete a picture unless they created it' do
      click_link 'Sign out'
      sign_up(email: "philip@test.com")
      expect(page).not_to have_content 'Delete'
      expect(page).to have_xpath("//img[contains(@src,'http://68.media.tumblr.com/9150621cddccbc705a6805d15b835767/tumblr_mrhvg5sMPz1r1thfzo1_1280.jpg')]")
    end
  end
end
