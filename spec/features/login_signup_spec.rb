require 'rails_helper'

feature 'login' do

   scenario 'Lets me signup' do
      visit '/'
      click_link 'Sign up'
      fill_in 'user name', with: 'RomanSlayer'
      fill_in 'email', with: 'roman_slayer@gmail.com'
      fill_in 'password', with: 'killtheromans'
      fill_in 'password[confirmation]', with: 'killtheromans'
      click_button 'Sign up'
      expect(page).to have_content 'Successfully signed up'
      expect(page).to have_content 'The Marvelous Picts Feed!'
   end

end
