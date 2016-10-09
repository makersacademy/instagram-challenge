require 'rails_helper'



feature 'Upload pictures' do
  let!(:user){ User.create(email: "test@example.com", password: "123456") }

  context 'Welcome Page' do
    scenario 'Welcome is displayed when loading the page' do
      sign_in
      visit '/'
      click_link('View Photos')
      expect(current_path).to eq('/photos')
      expect(page).to have_content("Add your photos and share you experiences!")
    end
  end

  context 'uploading photos' do
    scenario 'when a picture is uploaded, they should be displayed' do
      sign_in
      add_photo

      expect(current_path).to eq('/photos')

    end
  end
end
