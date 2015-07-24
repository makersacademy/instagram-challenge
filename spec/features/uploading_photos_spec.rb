feature 'Uploading photos' do
  context 'when logged in' do
    before(:each) do
      user = build(:user)
      sign_up_as(user)
    end

    it 'a user can upload an image' do
      visit new_photo_path
      fill_in 'Title', with: 'cool photo'
      # upload the file...
      # attach_file

      click_button 'Upload'

      expect(page).to have_content 'cool photo'
      expect(current_path).to eq photos_path
    end
  end

  context 'when not logged in' do
    it 'cannot upload photos' do

    end
  end
  
end
