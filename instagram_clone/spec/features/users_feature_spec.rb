require 'rails_helper'
require 'spec_helper'

feature 'User' do


    context 'user not signed in' do
      it 'should see "Sign up" and "Sign in" links on homepage' do
        visit('/')
        expect(page).to have_link("Sign in")
        expect(page).to have_link("Sign up")
      end
      it 'should see a flash message when successfully signed in' do
        sign_in
        expect(page).to have_content("Signed in successfully")
      end
      it 'should not see "Sign out" link on homepage' do
        visit('/')
        expect(page).not_to have_link("Sign out")
      end
    end

    context 'user signed in' do
      it 'should not see "Sign up" and "Sign in" links on homepage' do
        sign_up
        expect(page).not_to have_link("Sign in")
        expect(page).not_to have_link("Sign up")
      end

      it 'should be redirected back to homepage after clicking "Sign out"' do
        visit('/')
        sign_up
        click_link('Sign out')
        expect(page).to have_current_path('/')
      end

    end

    it 'can see a login form when not logged it' do
      visit('/users/sign_in')
      expect(page).to have_content("Log in")
    end

end
