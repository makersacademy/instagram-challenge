require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(title: 'Just a fan enjoying the game', url: 'http://68.media.tumblr.com/9150621cddccbc705a6805d15b835767/tumblr_mrhvg5sMPz1r1thfzo1_1280.jpg')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content 'Just a fan enjoying the game'
      expect(page).not_to have_content 'No pictures yet'
    end
  end
end
