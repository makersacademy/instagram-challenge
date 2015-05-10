require 'rails_helper'
require 'helpers/users_helper_spec'
require 'helpers/posts_helper_spec'

feature 'User' do

  include UsersHelper
  include PostsHelper

  context "user not signed in" do
    it 'displays sign in link and a sign up link' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    it 'not displays see sign out link' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end

    it 'can view users personal pages' do
      sign_up('user@test.com', 'testuser', 'testpassword')
      create_post('Awesome', 'It is awesome')
      click_link 'Sign out'
      go_to_view_page('Rubber duck')
      click_on("testuser")
      expect(page).to have_xpath("//img[@alt='Rubber duck']")
    end
  end

  context "user signed in on the homepage" do
    before do
      sign_up('user@test.com', 'testuser', 'testpassword')
    end

    it 'displays sign out link' do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    it 'not displays a sign in link and a sign up link' do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end
  end

  context 'user signed up' do
    before do
      sign_up('user@test.com', 'testuser', 'testpassword')
      click_link 'Sign out'
    end

    it 'can log in using email' do
      sign_in('user@test.com', 'testpassword')
      expect(page).to have_link 'Sign out'
    end

    it 'can log in using username' do
      sign_in('testuser', 'testpassword')
      expect(page).to have_link 'Sign out'
    end

    it 'can view his posts in his personal page' do
      sign_in('user@test.com', 'testpassword')
      create_post('Awesome', 'It is awesome')
      go_to_view_page('Rubber duck')
      within(".container") do
        click_on("testuser")
      end
      expect(page).to have_xpath("//img[@alt='Rubber duck']")
    end

    it 'can view other users personal pages' do
      sign_in('user@test.com', 'testpassword')
      create_post('Awesome', 'It is awesome')
      click_link 'Sign out'
      sign_up('another@test.com', 'anotheruser', 'testpassword')
      go_to_view_page('Rubber duck')
      click_on("testuser")
      expect(page).to have_xpath("//img[@alt='Rubber duck']")
    end
  end


end