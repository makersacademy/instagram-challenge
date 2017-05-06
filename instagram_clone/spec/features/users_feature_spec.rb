require 'rails_helper'
require 'spec_helper'

feature 'User' do


    context 'user not signed in' do
      it 'should see "Sign up" and "Sign in" links on homepage' do
        visit('/')
        expect(page).to have_link("Sign in")
        expect(page).to have_link("Sign up")
      end
      it 'should not see "Sign out" link on homepage' do
        visit('/')
        expect(page).not_to have_link("Sign out")
      end
    end

    context 'user signed in' do
      it 'should not see "Sign up" and "Sign in" links on homepage' do
        visit('/')
        click_link('Sign up')
        fill_in('Email', with: "mail@magnusholm.com")
        fill_in('Password', with: "123banana")
        fill_in('Password confirmation', with: "123banana")
        click_button('Sign up')
        expect(page).not_to have_link("Sign in")
        expect(page).not_to have_link("Sign up")
      end

      it 'should be redirected back to homepage after clicking "Sign out"' do
        visit('/')
        click_link('Sign up')
        fill_in('Email', with: "mail@magnusholm.com")
        fill_in('Password', with: "123banana")
        fill_in('Password confirmation', with: "123banana")
        click_button('Sign up')
        click_link('Sign out')
        expect(page).to have_current_path('/')
      end

    end

    it 'can see a login form when not logged it' do
      visit('/users/sign_in')
      expect(page).to have_content("Log in")
    end

end
