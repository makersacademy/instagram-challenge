require 'rails_helper'

feature 'Instapics' do
  context 'sharing pictures' do
    scenario 'pictures can be uploaded and shared with description filling up a form' do
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
      expect(current_path).to eq '/instapics'
      expect(page).to have_content 'Brunch for dinner!'
      expect(page).to have_http_status(200)
    end

    scenario 'the author nickname appear above the picture' do
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
      expect(current_path).to eq '/instapics'
      expect(page).to have_content 'MakerJenny'
    end

  end
end
