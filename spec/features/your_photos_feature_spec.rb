require 'rails_helper'

feature 'your photos' do

  context 'user not logged in' do

    scenario 'should display a prompt to login or sign up' do
      visit '/posts'
      expect(page).to have_content('You must sign in or sign up to view your snapshots')
      expect(page).to have_link('Sign up')
      expect(page).to have_link('Sign in')
    end

  end

end
