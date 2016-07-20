require 'rails_helper'
require_relative '../web_helpers'

describe 'Pictures features' do

  context 'default' do

    #US1
    #As a user of InstaRails
    #So I can show off my pictures
    #I want to add a picture with title/description
    scenario('user adds a picture, this is then shown on pictures index page') do

      create_account('user_email' => 't@t.c', 
                     'user_password' => '123456',
                     'user_password_confirmation' => '123456')

      #add picture
      visit('/pictures/new')
      fill_in('Title', with: 'lovely pic')
      fill_in('Description', with: 'me and my friends havin a blast')
      click_button('Save Picture')

      visit('/pictures')
      expect(page).to have_content('lovely pic')
      expect(page).to have_content('me and my friends havin a blast')
    end
  end
end
