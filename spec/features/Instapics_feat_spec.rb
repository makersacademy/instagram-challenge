require 'rails_helper'

feature 'Instapics' do
  context 'sharing pictures' do
    scenario 'pictures can be uploaded and shared with description filling up a form' do
      visit '/instapics'
      click_button 'Share Pic!'
      page.attach_file('instapic_image', Rails.root + 'app/assets/images/brunch.png')
      fill_in 'Description', with: 'Brunch for dinner!'
      click_button 'Share now'
      expect(current_path).to eq '/instapics'
      expect(page).to have_content 'Brunch for dinner!'
      expect(page).to have_http_status(200)
    end
  end
end
