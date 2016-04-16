require 'rails_helper'

feature 'Picture:' do
  context 'When no pictures added' do
    scenario 'prompts users to post a picture' do
      visit pictures_path
      expect(page).to have_content 'No picture has been added'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'When a picture has been added' do
    let!(:picture) { Picture.create(title: 'My Picture') }

    scenario 'displays a title of a posted picture' do
      visit pictures_path
      expect(page).to have_link 'My Picture'
    end
  end

  context "When a user visits a pictures page" do
    scenario 'user can post a picture with title' do
      visit pictures_path
      click_link 'Post a picture'
      fill_in 'Title', with: 'My Picture'
      click_button 'Post'
      expect(current_path).to eq pictures_path
      expect(page).to have_link 'My Picture'
    end
  end
end
