require 'rails_helper'

feature 'adding photos' do
  context 'no photo has been added; on homepage' do
    scenario 'displays a prompt to add photo' do
      visit '/photos'
      expect(page).to have_content 'No photo yet; Please add a photo.'
      expect(page).to have_link 'Add photo'
    end
  end

  context 'clicking "Add photo" link on homepage' do
    context 'logged out' do
      scenario 'cannot add photo' do
        visit '/photos'
        click_link 'Add photo'
        expect(page).not_to have_button 'Upload photo'
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
      end
    end

    context 'logged in' do
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
  end
end

feature 'showing individual photos of full size' do
  context 'clicking a photo on homepage' do
    scenario 'displays individual photo on a new page' do
      user = build :user
      sign_up user
      add_photo 'Testing', '#tag'
      click_link 'Like'
      leave_comment 'Nice!'
      click_link 'Testing'
      expect(page).to have_content 'Testing'
      expect(page).to have_content '#tag'
      expect(page).to have_selector :css, "img[src*='testing.jpg']"
      expect(page).to have_content user.email
      expect(page).to have_content '1 like'
      expect(page).to have_content 'Nice!'
      expect(current_path).to eq '/photos/1'
    end
  end
end

feature 'showing all photos created by a particular user' do
  context 'clicking a user email on homepage' do
    scenario 'displays all photos created by that user' do
      user = build :user
      sign_up user
      add_photo 'Testing1', '#tag'
      click_link 'Like'
      leave_comment 'Nice!'
      add_photo 'Testing2', '#tag'
      within '#photo0' do
        click_link user.email
      end
      expect(page).to have_content 'Testing1'
      expect(page).to have_content 'Testing2'
      expect(page).to have_content '#tag'
      expect(page).to have_selector :css, "img[src*='testing.jpg']"
      expect(page).to have_content user.email
      expect(page).to have_content '1 like'
      expect(page).to have_content 'Nice!'
      expect(current_path).to eq "/users/1/photos"
    end
  end
end

feature 'showing all photos associated with a tag' do
  context 'clicking a tag on homepage' do
    scenario 'displays all photos associated with the same tag' do
      user = build :user
      sign_up user
      add_photo 'Testing1', '#tag'
      click_link 'Like'
      leave_comment 'Nice!'
      add_photo 'Testing2', '#tag'
      within '#photo0tag0' do
        click_link '#tag'
      end
      expect(page).to have_content 'Testing1'
      expect(page).to have_content 'Testing2'
      expect(page).to have_content '#tag'
      expect(page).to have_selector :css, "img[src*='testing.jpg']"
      expect(page).to have_content user.email
      expect(page).to have_content '1 like'
      expect(page).to have_content 'Nice!'
      expect(current_path).to eq "/tags/1/photos"
    end
  end
end

feature 'deleting a photo' do
  scenario 'can only delete photos uploaded by oneself' do
    user1 = build :user
    sign_up user1
    add_photo 'Testing', '#tag'
    click_link 'Sign out'
    user2 = build :user, email: 'testing2@testing.com'
    sign_up user2
    expect(page).not_to have_link 'Delete photo'
  end

  context 'clicking a "Delete photo" link on homepage, logged in' do
    scenario 'can delete photo' do
      user = build :user
      sign_up user
      add_photo 'Testing', '#tag'
      click_link 'Like'
      leave_comment 'Nice!'
      click_link 'Delete photo'
      expect(page).not_to have_content 'Testing'
      expect(page).not_to have_content '#tag'
      expect(page).not_to have_selector :css, "img[src*='testing.jpg']"
      expect(page).not_to have_content user.email
      expect(page).not_to have_content '1 like'
      expect(page).not_to have_content 'Nice!'
      expect(current_path).to eq "/photos"
    end
  end
end

def add_photo title, tag
  click_link 'Add photo'
  fill_in 'Title', with: title
  attach_file 'photo[image]', 'spec/fixtures/images/testing.jpg'
  fill_in 'photo[tag][phrase]', with: tag
  click_button 'Upload photo'
end
