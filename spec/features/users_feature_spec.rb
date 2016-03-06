require 'rails_helper'

feature 'User can log in and out' do
  context 'user is not signed in and on the homepage' do
    scenario "display 'log in' and 'sign up' links" do
      visit '/'
      expect(page).to have_link 'Log in'
      expect(page).to have_link 'Sign up'
    end

    scenario "do not display a 'log out' link" do
      visit '/'
      expect(page).not_to have_link 'Log out'
    end
  end

  context 'user is signed in and on the homepage' do
    before { sign_up }

    scenario "display a 'log out' link" do
      visit '/'
      expect(page).to have_link 'Log out'
    end

    scenario "do not display 'log in' and 'log out' links" do
      visit '/'
      expect(page).not_to have_link 'Log in'
      expect(page).not_to have_link 'Log up'
    end
  end

  context 'signing up' do
    before do
      sign_up(username: 'test_user')
      log_out
    end

    scenario 'user cannot sign up with existing username' do
      sign_up(username: 'test_user', email: 'other@email.com')

      expect(page).to have_content 'Username has already been taken'
      expect(page).to have_content 'Sign up'
    end
  end
end
