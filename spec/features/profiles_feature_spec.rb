feature 'User Profiles' do

  context 'A signed up user' do
    before { sign_up(username: 'mannieg') }

    scenario 'Each signed up user has there own personal profile page' do
      click_link 'Profile'
      expect(current_path).to eq '/mannieg'
      expect(page).to have_content 'mannieg'
    end

    scenario 'A logged in user can upload a picture to there profile' do
      click_link 'Upload'
      fill_in 'Description', with: 'This is my first post :)'
      attach_file('post_image', "#{Dir.pwd}/spec/features/test_images/garden.jpg")
      click_button 'Post'
      expect(current_path).to eq '/mannieg'
      expect(page).to have_xpath '/html/body/div[1]/div/img'
      expect(page).to have_content 'This is my first post :)'
    end
  end
end
