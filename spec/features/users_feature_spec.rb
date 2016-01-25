require 'rails_helper'

describe 'user features' do
  feature "sign up, log in and log out links" do

    context "user not signed in and on the homepage" do
      scenario "should see a 'log in' link and a 'sign up' link" do
        visit('/')
        expect(page).to have_link('Log in')
        expect(page).to have_link('Sign up')
      end

      scenario "should not see 'log out' link" do
        visit('/')
        expect(page).not_to have_link('Log out')
      end
    end

    context "user signed in on the homepage" do
      before do
        visit('/')
        click_link('Sign up')
        fill_in('Email', with: 'test@example.com')
        fill_in('Password', with: 'testtest')
        fill_in('Password confirmation', with: 'testtest')
        click_button('Sign up')
      end

      scenario "should see 'log out' link" do
        visit('/')
        expect(page).to have_link('Log out')
      end

      scenario "should not see a 'log in' link and a 'sign up' link" do
        visit('/')
        expect(page).not_to have_link('Log in')
        expect(page).not_to have_link('Sign up')
      end
    end
  end
end
