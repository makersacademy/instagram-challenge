# frozen_string_literal: true

describe 'Sign-out Features' do

  feature 'Redirects to home page' do
    scenario 'when clicking on logout icon' do
      sign_up_helper
      click_on(id: 'sign_out_link')
      expect(current_path).to eq('/')
    end
  end

  feature 'Users see a success message' do
    scenario 'after logging out' do
      sign_up_helper
      click_on(id: 'sign_out_link')
      expect(page).to have_content('Signed out successfully.')
    end
  end

end
