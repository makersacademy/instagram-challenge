require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet!'
      expect(page).to have_link 'Click here to add a picture!'
    end
  end

  context 'uploading a picture' do
    scenario 'succeeds when a title is entered' do
      sign_up
      upload_picture
      expect(page).to have_css("img[src*='Pompey.jpg']")
    end

    scenario 'fails without a title' do
      sign_up
      visit '/pictures'
      click_link 'Click here to add a picture!'
      attach_file "Image", 'spec/features/Pompey.jpg'
      click_button 'Upload picture'
      expect(page).to have_content 'error'
    end

    scenario 'does not succeed without an image file' do
      sign_up
      visit '/pictures'
      click_link 'Click here to add a picture!'
      fill_in 'Title', with: 'nothing'
      click_button 'Upload picture'
      expect(page).to have_content 'error'
    end

  end

  context 'viewing a picture' do
    let!(:pfc) {Picture.create(title:'PFC',
                               image: File.new("spec/features/Pompey.jpg"))}
    scenario 'allows a picture to be viewed by clicking on the title' do
      visit '/pictures'
      click_link 'PFC'
      expect(page).to have_content 'PFC'
      expect(current_path).to eq "/pictures/#{pfc.id}"
    end
  end

  context 'editing a picture' do
    scenario 'allows a user to edit the title' do
      sign_up
      upload_picture
      visit '/pictures'
      click_link 'Edit PFC'
      fill_in 'Title', with: 'Pompey'
      click_button 'Update Title'
      expect(page).to have_content 'Pompey'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'deleting a picture' do
    scenario 'allows an image to be deleted' do
      sign_up
      upload_picture
      visit '/pictures'
      click_link 'Delete PFC'
      expect(page).not_to have_content 'PFC'
      expect(page).not_to have_css("img[src*='Pompey.jpg']")
      expect(page).to have_content 'Picture deleted successfully'
    end
  end

  def sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def upload_picture
    visit '/pictures'
    click_link 'Click here to add a picture!'
    fill_in 'Title', with: 'PFC'
    attach_file "Image", 'spec/features/Pompey.jpg'
    click_button 'Upload picture'
  end

end
