# frozen_string_literal: true

describe 'Sign-in Features' do

  feature 'Leads to sign in page' do
    scenario 'when clicking on login icon' do
      visit "/home/index"
      click_on(id: 'sign_in_link')
      expect(current_path).to eq('/users/sign_in')
    end
  end

  feature 'Users see success message' do
    scenario 'after logging in' do
      sign_up_helper
      click_on(id: 'sign_out_link')
      click_on(id: 'sign_in_link')
      fill_in('user_email', with: 'test@test.com')
      fill_in('user_password', with: '123456')
      click_button('commit')
      expect(current_path).to eq('/')
      expect(page).to have_content('Signed in successfully.')
    end
  end

end
