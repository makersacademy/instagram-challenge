require 'rails_helper'
require_relative '../web_helpers'

describe 'Users features' do

  context 'when a picture has been created' do

    #US4
    #As a user of InstaRails
    #So I can delete some or all of my pictures and prevent other users from doing so
    #I want to sign up/sign in/sign out
    scenario 'user deletes picture, this is not shown in pictures index page' do

      create_account('user_email' => 't@t.c', 
                     'user_password' => '123456',
                     'user_password_confirmation' => '123456')

      #create picture
      visit('/pictures/new')
      fill_in('Title', with: 'lovely pic')
      fill_in('Description', with: 'me and my friends havin a blast')
      click_button('Save Picture')

      #delete picture
      visit('/pictures')
      click_button('Delete')
      expect(page).not_to have_content('lovely pic')
    end

    scenario 'second user cannot see the delete button' do

      create_account('user_email' => 't@t.c', 
                     'user_password' => '123456',
                     'user_password_confirmation' => '123456')

      #create picture
      visit('/pictures/new')
      fill_in('Title', with: 'lovely pic')
      fill_in('Description', with: 'me and my friends havin a blast')
      click_button('Save Picture')

      #Create account 2
      click_link('Sign out')
      create_account('user_email' => 'f@f.f', 
                     'user_password' => '123456',
                     'user_password_confirmation' => '123456')

      visit('/pictures')
      expect(page).not_to have_button('Delete')
    end
  end
end
