# frozen_string_literal: true

describe 'Profile Features' do

  feature 'Redirects to profile page' do
    scenario 'when clicking on profile icon' do
      sign_up_helper
      click_on(id: 'profile_link')
      expect(current_path).to eq('/users/1')
    end
  end

  feature 'Display username' do
    scenario 'on a profile page' do
      sign_up_helper
      click_on(id: 'profile_link')
      expect(page).to have_css('.username')
    end
  end

  feature 'Display connection and post details' do
    scenario 'on a profile page' do
      sign_up_helper
      click_on(id: 'profile_link')
      expect(page).to have_content('posts')
      expect(page).to have_content('followers')
      expect(page).to have_content('following')
    end
  end

  feature 'Display name' do
    scenario 'on a profile page' do
      sign_up_helper
      click_on(id: 'profile_link')
      expect(page).to have_css('.name')
    end
  end

  feature 'Display bio' do
    scenario 'on a profile page' do
      sign_up_helper
      click_on(id: 'profile_link')
      expect(page).to have_css('.bio')
    end
  end

  feature 'Has an edit button' do
    scenario 'on a profile page' do
      sign_up_helper
      click_on(id: 'profile_link')
      expect(page).to have_css('.edit-profile')
    end
  end

end
