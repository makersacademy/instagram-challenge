require 'rails_helper'

feature 'Like' do

  context 'likes on pictures' do
    scenario 'pictures can receive likes that are then displayed', js: true do
      visit '/'
      click_button 'Join Instapic!'
      fill_in 'user_nickname', with: 'MakerJenny'
      fill_in 'user_email', with: 'jenny@makers.com'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'
      click_button 'Sign up'
      click_button 'Share Pic!'
      page.attach_file('instapic_image', Rails.root + 'app/assets/images/brunch.png')
      fill_in 'Description', with: 'Brunch for dinner!'
      click_button 'Share now'
      click_link 'Like'
      expect(page).to have_content '1 like'
    end
  end

end
