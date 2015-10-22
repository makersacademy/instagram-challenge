require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been uploaded' do

    scenario 'should have link to upload a picture' do
      visit '/pictures'
      expect(page).to have_content "No one has uploaded any pictures yet!"
    end

  end

  context 'pictures has been uploaded' do

    scenario 'display pictures' do
      User.create(username: 'test_user', email: 'test@test.com', password: '12344321', password_confirmation: '12344321')
      Picture.create(caption: 'coding at home', name: 'Nightlife', user_id: 1)
      visit '/pictures'
      expect(page).to have_content 'Nightlife'
      expect(page).to have_content 'coding at home'
      expect(page).not_to have_content 'No one has uploaded any pictures yet!'
    end

  end

  context 'uploading a picture' do

    # before do
    #   User.create(username: 'test_user', email: 'test@test.com', password: '12344321', password_confirmation: '12344321')
    #   Picture.create(caption: 'coding at home', name: 'Nightlife', user_id: 1)
    # end

    scenario 'when not logged in cannot upload pictures' do
      visit '/pictures'
      expect(page).to have_content 'Sign in'
      expect(page).not_to have_link "Upload a picture"
      # expect(page).to have_content 'You must be signed up to upload pictures'
    end

  end

  # context 'deleting pictures' do
  #
  #   before do
  #     Picture.create(caption: 'coding at home', name: 'Nightlife')
  #   end
  #
  #   scenario 'display pictures' do
  #     visit '/pictures'
  #     expect(page).to have_content 'coding at home'
  #     expect(page).to have_link 'Delete Nightlife'
  #   end
  #
  #   scenario 'can delete a picture' do
  #     visit '/pictures'
  #     click_link 'Delete Nightlife'
  #     expect(current_path).to eq '/pictures'
  #     expect(page).to have_content "Picture deleted successfully"
  #     expect(page).to have_content "No one has uploaded any pictures yet!"
  #   end
  #
  # end
  #
  # context 'uploading new pictures' do
  #
  #   scenario 'give a user a form for add a new picture then display it' do
  #     visit '/pictures'
  #     click_link 'Upload a picture'
  #     fill_in 'Name', with: 'Had Nandos!'
  #     fill_in 'Caption', with: 'what a day!'
  #     page.attach_file("picture_image", File.absolute_path('./spec/imgs/nandos.png'))
  #     click_button 'Create Picture'
  #     expect(page).to have_css('img', text: "")
  #     expect{page.find(:xpath, "//img[@alt='Nandos']")}.not_to raise_error
  #   end
  #
  # end

end
