require 'rails_helper'

feature 'Pictures' do

  before(:each) do
    @user = create(:user)
    @user2 = create(:user, username:'some_user', email: 'test2@email.com')
  end

  context 'no pictures have been uploaded' do

    scenario 'should have link to upload a picture' do
      visit '/pictures'
      expect(page).to have_content "No one has uploaded any pictures yet!"
    end

  end

  context 'pictures has been uploaded' do

    scenario 'display pictures' do
      @user.pictures.create(caption: 'coding at home', name: 'Nightlife', image_file_name: 'nightlife.png')
      visit '/pictures'
      expect(page).to have_content 'Nightlife'
      expect(page).to have_content 'coding at home'
      expect(page).not_to have_content 'No one has uploaded any pictures yet!'
    end

  end

  context 'uploading a picture' do

    scenario 'when not signed in cannot upload pictures' do
      visit '/pictures'
      expect(page).to have_content 'Sign in'
      expect(page).not_to have_link "Upload a picture"
      expect(page).to have_content 'You must be signed in to upload pictures'
    end

    scenario 'when signed in can upload pictures' do
      visit '/pictures'
      sign_in(@user)
      visit '/pictures'
      click_link 'Upload a picture'
      fill_in 'Name', with: 'Had Nandos!'
      fill_in 'Caption', with: 'what a day!'
      page.attach_file("picture_image", File.absolute_path('./spec/imgs/nandos.png'))
      click_button 'Create Picture'
      expect(page).to have_css('img', text: "")
      expect{page.find(:xpath, "//img[@alt='Nandos']")}.not_to raise_error
    end

  end

  context 'deleting pictures' do

    scenario 'can delete a picture which you uploaded' do
      visit '/pictures'
      sign_in(@user)
      click_link 'Upload a picture'
      fill_in 'Name', with: 'Nightlife'
      fill_in 'Caption', with: 'coding at home'
      page.attach_file("picture_image", File.absolute_path('./spec/imgs/test.png'))
      click_button 'Create Picture'
      click_link 'Delete Nightlife'
      expect(page).to have_content 'No one has uploaded any pictures yet!'
    end

    scenario 'cannot delete a picture which you did not upload' do
      visit '/pictures'
      sign_in(@user)
      click_link 'Upload a picture'
      fill_in 'Name', with: 'Nightlife'
      fill_in 'Caption', with: 'coding at home'
      page.attach_file("picture_image", File.absolute_path('./spec/imgs/test.png'))
      click_button 'Create Picture'
      click_link("Sign out")
      sign_in(@user2)
      expect(page).not_to have_link 'Delete Nightlife'
    end

  end

  context 'editing picture information' do

    scenario 'can edit information on a picture you uploaded' do
      visit "/pictures"
      sign_in(@user)
      click_link 'Upload a picture'
      fill_in 'Name', with: 'Nightlife'
      fill_in 'Caption', with: 'coding at home'
      page.attach_file("picture_image", File.absolute_path('./spec/imgs/test.png'))
      click_button 'Create Picture'
      click_link 'Edit Nightlife'
      fill_in 'Name', with: 'Daylife'
      fill_in 'Caption', with: 'coding at home'
      click_button 'Update Picture'
      expect(page).to have_content 'Daylife'
      expect(page).to have_css('img', text: "")
      expect{page.find(:xpath, "//img[@alt='Test']")}.not_to raise_error
    end

    scenario "cannot edit a picture someone else uploaded" do
      visit '/pictures'
      sign_in(@user)
      click_link 'Upload a picture'
      fill_in 'Name', with: 'Nightlife'
      fill_in 'Caption', with: 'coding at home'
      page.attach_file("picture_image", File.absolute_path('./spec/imgs/test.png'))
      click_button 'Create Picture'
      click_link "Sign out"
      sign_in(@user2)
      expect(page).not_to have_link 'Edit Nightlife'
    end

  end

end
