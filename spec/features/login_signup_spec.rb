require 'rails_helper'

feature 'login' do

   scenario 'Lets me signup' do
      visit '/'
      click_link 'Sign up'
      fill_in "user[user_name]", with: 'RomanSlayer'
      fill_in 'Email', with: 'roman_slayer@gmail.com'
      fill_in "user[password]", with: 'killtheromans'
      fill_in "user[password_confirmation]", with: 'killtheromans'
      click_button 'Sign up'
      expect(page).to have_content 'Successfully signed up to the best website ever! Good choice :)'
      expect(page).to have_content 'The Marvelous Picts Feed!'
   end

end
