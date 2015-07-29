feature 'Uploading photos' do
  context 'when logged in' do
    before(:each) do
      user = build(:user)
      sign_up_as(user)
    end

    it 'a user can upload an image' do
      visit new_photo_path
      attach_file 'photo[gram]', './spec/test_images/Honda-Gold-Wing-White.jpg'

      click_button 'Create Photo'

      expect(page).to have_content 'cool photo'
      expect(current_path).to eq photos_path
    end
  end

  context 'when not logged in' do
    it 'cannot upload photos' do
      visit root_path
      click_link 'Upload photo'

      expect(page).to have_content 'Log in'
      expect(current_path).to eq new_user_session_path
    end
  end

end
