require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to upload a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Upload a photo'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(title: 'Best Burger')
    end
    scenario 'display title of photos' do
      visit '/photos'
      expect(page).to have_content 'Best Burger'
      expect(page).not_to have_content 'No photos yet'
    end
  end

  context 'viewing photos' do
    let!(:bestburger){Photo.create(title:'Best burger')}
    scenario 'titles are links' do
      visit '/photos'
      click_link 'Best burger'
      expect(page).to have_content 'Best burger'
      # how to test stub image
      expect(current_path).to eq "/photos/#{bestburger.id}"
    end
  end

  context 'adding photos' do
    before do
      sign_up
    end
    scenario 'Adding title' do
      visit '/photos'
      click_link 'Upload a photo'
      fill_in 'Title', with: 'Best Burger'
      click_button 'Upload photo'
      expect(page).to have_content 'Best Burger'
    end

    scenario 'Adding Image' do
      upload_photo
      expect(page).to have_content 'Best Burger'
      expect(page).to have_css ('img[src*="bestburger.png"]')
    end
  end

  scenario 'cannot upload photo unless signed in' do
    visit '/photos'
    click_link 'Upload a photo'
    expect(page).to have_content 'Log in'
  end

  context 'editing restaurants' do

  before do
    Photo.create title: 'Best burger'
    sign_up
  end

    scenario 'let a user edit a photo' do
      visit '/photos'
      click_link 'Best burger'
      click_link 'Edit'
      fill_in 'Title', with: 'Five Guys'
      click_button 'Update Photo'
      expect(page).to have_content 'Five Guys'
      expect(current_path).to eq '/photos'
    end
  end

  context 'deleting images' do

    before do
      Photo.create title: 'Best burger'
      sign_up
    end

    scenario 'removes a photo when a user clicks a delete link' do
      visit '/photos'
      click_link 'Best burger'
      click_link 'Delete'
      expect(page).not_to have_content 'Best burger'
      expect(page).to have_content 'Photo deleted successfully'
    end

    # scenario 'cannot remove image if user did not add it' do
    #   visit '/photos'
    #   click_link 'Sign out'
    #   visit '/photos'
    #   click_link 'Best burger'
    #   expect(page).not_to have_content 'Delete'
    # end

  end

  def upload_photo
    visit '/photos'
    click_link 'Upload a photo'
    fill_in 'Title', with: 'Best Burger'
    attach_file 'photo[image]', 'spec/features/bestburger.png'
    click_button 'Upload photo'
  end
  def sign_up
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'
  end
end
