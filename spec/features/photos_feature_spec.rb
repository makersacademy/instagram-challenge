require 'rails_helper'

feature 'adding photos' do
  context 'no photo has been added; on index page' do
    scenario 'displays a prompt to add photo' do
      visit '/photos'
      expect(page).to have_content 'No photo yet'
      expect(page).to have_link 'Add photo'
    end
  end

  scenario 'can add photo' do
    user = build :user
    sign_up user
    click_link 'Add photo'
    fill_in 'Title', with: 'Testing'
    attach_file 'photo[image]', 'spec/fixtures/images/testing.jpg'
    click_button 'Upload photo'
    expect(page).to have_content 'Testing'
    expect(page).to have_selector :css, "img[src*='testing.jpg']"
    expect(page).to have_content user.email
    expect(current_path).to eq '/photos'
  end
end

feature 'showing individual photos' do
  context 'clicking a photo on index page' do
    scenario 'displays individual photo on a new page' do
      user = build :user
      sign_up user
      add_photo 'Testing'
      click_link 'Testing'
      expect(page).to have_content 'Testing'
      expect(page).to have_selector :css, "img[src*='testing.jpg']"
      expect(current_path).to eq '/photos/1'
    end
  end
end

feature 'showing all photos created by a particular user' do
  context 'clicking a user email on index page' do
    scenario 'displays all photos created by that user' do
      user = build :user
      sign_up user
      add_photo 'Testing1'
      add_photo 'Testing2'
      within "#photo0" do
        click_link user.email
      end
      expect(page).to have_content 'Testing'
      expect(page).to have_content 'Testing2'
      expect(page).to have_selector :css, "img[src*='testing.jpg']"
      expect(current_path).to eq "/users/1/photos"
    end
  end
end

def add_photo title
  click_link 'Add photo'
  fill_in 'Title', with: title
  attach_file 'photo[image]', 'spec/fixtures/images/testing.jpg'
  click_button 'Upload photo'
end

def sign_up user
  visit '/photos'
  click_link 'Sign up'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  fill_in 'Password confirmation', with: user.password_confirmation
  click_button 'Sign up'
end
