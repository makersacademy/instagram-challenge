require 'rails_helper'

feature 'User' do

  context 'not signed in on the homepage' do
    it 'should see a sign in link and a sign up link' do
      visit pictures_path
      expect(page).to have_link 'Log in'
      expect(page).to have_link 'Sign up'
    end

    it 'should not see sign out link' do
      visit pictures_path
      expect(page).not_to have_link 'Sign out'
    end
  end

  context "signed in on the homepage" do

    before do
      visit pictures_path
      click_link 'Sign up'
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button 'Sign up'
    end

    it 'should see sign out link' do
      visit pictures_path
      expect(page).to have_link 'Sign out'
    end

    it 'should not see a sign in link and a sign up link' do
      visit pictures_path
      expect(page).not_to have_link 'Log in'
      expect(page).not_to have_link 'Sign up'
    end
  end

end
