require 'rails_helper'

feature 'Picture:' do
  context 'No pictures added' do
    scenario 'prompts users to post a picture' do
      visit pictures_path
      expect(page).to have_content 'No picture has been added'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'A picture has been added' do
    let!(:picture) { Picture.create(title: 'My Picture') }

    scenario 'displays a title of a posted picture' do
      visit pictures_path
      expect(page).to have_link 'My Picture'
    end
  end
end
