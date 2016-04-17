require 'rails_helper'

feature 'sharing moments' do
  context 'no moments have been shared' do
    scenario 'a user can upload a moment' do
      visit '/'
      expect(page).to have_content('No moments have been shared yet')
      expect(page).to have_link('Share a moment')
    end
  end

  context 'a moment has been shared' do
    before do
      share_a_moment
    end

    scenario 'displays all the moments' do
      expect(page).to have_content('Something profound')
    end
  end

  context 'adding a moment' do
    scenario 'a user must sign in to add a moment with an image' do
      share_a_moment
      expect(page).to have_content('You must sign in to share')
    end

    scenario 'a signed-in user can add a moment with an image' do
      share_a_moment
      expect(page).to have_content('Something profound')
      expect(page).to have_css("img[src*='Scissors_icon']")
    end
  end

  context 'deleting moments' do
    before do
      share_a_moment
    end

    scenario 'users can delete moments' do
      click_link 'Delete'
      expect(page).to have_content('Moment deleted')
      expect(page).not_to have_content('Something profound')
      expect(page).not_to have_css("img[src*='Scissors_icon']")
    end
  end
end
