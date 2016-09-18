feature 'User Profiles' do

  context 'A signed up user' do
    before { sign_up(username: 'mannieg') }

    scenario 'Each signed up user has there own personal profile page' do
      click_link 'Profile'
      expect(current_path).to eq '/mannieg'
      expect(page).to have_content 'mannieg'
    end

    scenario 'A logged in user can upload a picture to there profile' do
      create_a_post
      expect(current_path).to eq '/mannieg'
      expect(page).to have_xpath '//*[@id="1"]'
      expect(page).to have_content 'This is my first post :)'
    end

    scenario 'Can upload a custom profile picture', :focus => true do
      click_link 'Profile'
      attach_file('#add-profile-img', "#{Dir.pwd}/spec/features/test_images/demo-profile-img.png")
      click_button 'Save'
      expect(current_path).to eq '/mannieg'
      expect(page).to have_xpath '//img[@class="img-circle"]'
    end
  end
end
