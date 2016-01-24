require 'rails_helper'

RSpec.feature '<<Users>>' do
  context 'user not signed in and on homepage' do
    it 'should show a link for sign in and sign up' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    it 'should not show a link for sign out' do
      visit '/'
      expect(page).to_not have_link 'Sign out'
    end

    it 'should not allow a user to create a picture' do
      visit '/'
      click_link 'Upload a picture...'
      expect(current_path).to eq '/users/sign_in'
    end
  end

  context 'user signed in and on homepage' do

    before do
      sign_up_1
    end

    it 'should show a link for sign out' do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    it 'should not show links for sign in and sign up' do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end

    it 'should allow a user to add a picture' do
      visit '/'
      click_link 'Upload a picture...'
      expect(current_path).to eq '/pictures/new'
    end
  end

end
