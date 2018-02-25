require 'rails_helper'

feature 'login' do
    background do
      sign_up('roman_slayer@gmail.com', 'RomanSlayer')
    end

   scenario 'Lets me signup and changes nav bar accordingly' do
      expect(page).to have_content 'Successfully signed up to the best website ever! Good choice :)'
      expect(page).to have_content 'The Marvelous Picts Feed!'
      expect(page).not_to have_content 'Sign up'
      expect(page).not_to have_content 'Login'
      expect(page).to have_content 'Logout'
   end

   scenario 'lets me logout and changes nav bar' do
     click_link 'Logout'
     expect(page).to have_content 'You\'ve logged out, see you again for more Pictogram soon!'
     expect(page).not_to have_content 'Logout'
     expect(page).to have_content 'Sign up'
     expect(page).to have_content 'Login'
   end

   scenario 'I can login to user account' do
      click_link 'Logout'
      click_link 'Login'
      fill_in 'user[email]', with: 'roman_slayer@gmail.com'
      fill_in "user[password]", with: 'killtheromans'
      click_button 'Log in'
      expect(page).to have_content 'Welcome back to the best website ever! Pictogram to your hearts content!'
      expect(page).to have_content 'The Marvelous Picts Feed!'
   end

   scenario 'I can\'t login with the same username or email' do
      click_link 'Logout'
      click_link 'Sign up'
      sign_up('roman_slayer@gmail.com', 'RomanSlayer')
      expect(page).to have_content 'Account with email already exists, why not try logging in instead?'
      expect(page).to have_content 'Username already taken'
      expect(page).not_to have_content 'Successfully signed up to the best website ever! Good choice :)'
      expect(page).not_to have_content 'The Marvelous Picts Feed!'
   end

   scenario 'You cannot go onto new post if you\' not logged in' do
      click_link 'Logout'
      click_link 'New Pict'
      expect(page).to have_content 'Cannot do that without signing up...or logging in...'
      expect(page).not_to have_content ' Add a new Pict!'
   end

end
