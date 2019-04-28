# frozen_string_literal: true

describe 'Edit Profile Features' do

  feature 'Redirects to edit profile page' do
    scenario 'when clicking on edit profile link' do
      sign_up_helper
      click_on(id: 'profile_link')
      click_on(class: 'edit-profile')
      expect(current_path).to eq('/users/1/edit')
    end
  end

  feature 'Updates name' do
    scenario 'from the edit profile page' do
      sign_up_helper
      click_on(id: 'profile_link')
      click_on(class: 'edit-profile')
      fill_in('user[name]', with: 'Testy McTesterson')
      click_on(class: 'btn btn-primary')
      expect(page).to have_content('Testy McTesterson')
    end
  end

  feature 'Updates username' do
    scenario 'from the edit profile page' do
      sign_up_helper
      click_on(id: 'profile_link')
      click_on(class: 'edit-profile')
      fill_in('user[username]', with: '@testy')
      click_on(class: 'btn btn-primary')
      expect(page).to have_content('@testy')
    end
  end

  feature 'Updates bio' do
    scenario 'from the edit profile page' do
      sign_up_helper
      click_on(id: 'profile_link')
      click_on(class: 'edit-profile')
      fill_in('user[bio]', with: 'I am a testy tester.')
      click_on(class: 'btn btn-primary')
      expect(page).to have_content('I am a testy tester.')
    end
  end

end
