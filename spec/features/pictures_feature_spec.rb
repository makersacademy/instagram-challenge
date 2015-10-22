require 'rails_helper'

feature 'Pictures' do

  context 'no pictures have been uploaded' do

    scenario 'should have link to upload a picture' do
      visit '/pictures'
      expect(page).to have_content "No one has uploaded any pictures yet!"
    end

  end

  context 'pictures has been uploaded' do

    scenario 'display pictures' do
      User.create(username: 'test_user', email: 'test@test.com', password: '12344321', password_confirmation: '12344321')
      Picture.create(caption: 'coding at home', name: 'Nightlife', user_id: 1, image_file_name: 'nightlife.png')
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
      user = create(:user)
      sign_in(user)
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
      user = create(:user)
      sign_in(user)
      click_link 'Upload a picture'
      fill_in 'Name', with: 'Nightlife'
      fill_in 'Caption', with: 'coding at home'
      page.attach_file("picture_image", File.absolute_path('./spec/imgs/test.png'))
      click_button 'Create Picture'
      visit '/pictures'
      click_link 'Delete Nightlife'
      expect(page).to have_content 'No one has uploaded any pictures yet!'
    end

    scenario 'cannot delete a picture which you did not upload' do
      visit '/pictures'
      user = create(:user)
      sign_in(user)
      click_link 'Upload a picture'
      fill_in 'Name', with: 'Nightlife'
      fill_in 'Caption', with: 'coding at home'
      page.attach_file("picture_image", File.absolute_path('./spec/imgs/test.png'))
      click_button 'Create Picture'
      visit '/pictures'
      click_link("Sign out")

      # click_link('Sign up')
      # fill_in('Username', with: 'test2')
      # fill_in('Email', with: 'test2@example.com')
      # fill_in('Password', with: 'testtest')
      # fill_in('Password confirmation', with: 'testtest')
      # click_button('Sign up')

      # user2 = User.create(username: 'test2', email: 'test2@example.com', password: '12344321', password_confirmation: '12344321')


      user2 = create(:user, username:'some_user', email: 'test2@email.com')
      sign_in(user2)
      expect(page).not_to have_link 'Delete Nightlife'
    end
    #
    # scenario 'can delete a picture' do
    #   visit '/pictures'
    #   click_link 'Delete Nightlife'
    #   expect(current_path).to eq '/pictures'
    #   expect(page).to have_content "Picture deleted successfully"
    #   expect(page).to have_content "No one has uploaded any pictures yet!"
    # end

  end


end
