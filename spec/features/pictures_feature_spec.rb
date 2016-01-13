require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      sign_up('test@test.com', '12345678')
      expect(page).not_to have_content 'Add a comment'
      expect(page).not_to have_content 'likes'
      expect(page).to have_link 'New post'
    end

    scenario 'a picture can be added' do
      sign_up('test@test.com', '12345678')
      upload_picture('a test picture')
      within('.post') do
        expect(page).to have_css("img[src*='test.jpg']")
      end
    end
  end

  context 'pictures have been added' do
    before do
      sign_up('test@test.com', '12345678')
      upload_picture('a test picture') 
    end

    scenario 'display caption for each picture' do 
      within('.post') do  
        expect(page).to have_content('a test picture')
      end
    end
  end
end