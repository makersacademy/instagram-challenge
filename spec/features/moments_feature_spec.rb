require 'rails_helper'

feature 'sharing moments' do

  context 'no moments have been shared' do
    scenario 'a user can upload a moment' do
      visit '/moments'
      expect(page).to have_content('No moments have been shared yet')
      expect(page).to have_link('Share a moment')
    end
  end

  context 'a moment has been shared' do
    scenario 'displays all the moments' do
      visit '/'
      share_a_moment_signed_in
      expect(page).to have_content('Something profound')
    end
  end

  context 'adding an image' do

    scenario 'users can add a moment with an image' do
      share_a_moment_signed_in
      expect(page).to have_content('Something profound')
      expect(page).to have_css("img[src*='Scissors_icon']")
    end

    scenario 'non signed in users cannot add a moment with an image' do
      visit '/'
      click_link 'Share a moment'
      expect(current_path).to eq('/users/sign_in')
    end

  end

  context 'show the moment page' do
    scenario 'user can go to the image page' do
      share_a_moment_signed_in
      expect(current_path).to eq('/moments')
      find(:xpath, "//a/img[@alt='moment']/..").click
      expect(page).to have_content('hello')
      expect(page).to have_css("img[src*='Scissors_icon']")
    end
  end

  context 'deleting moments' do
    before do
      share_a_moment_signed_in
    end

    scenario 'users can delete moments' do
      #changed functionality, need to click image link
      click_link 'Delete'
      expect(page).to have_content('Moment deleted')
      expect(page).not_to have_content('Something profound')
      expect(page).not_to have_css("img[src*='Scissors_icon']")
    end
  end
end
