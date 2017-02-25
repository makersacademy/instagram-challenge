require 'rails_helper'

feature 'Instapics' do
  context 'sharing pictures' do
    scenario 'pictures can be uploaded and shared with description filling up a form' do
      visit '/instapics'
      click_button 'Share Pic!'
      # page.attach_file('image', Rails.root + 'app/assets/images/7-hull.jpg')
      fill_in 'Description', with: 'Brunch for dinner!'
      click_button 'Share now'
      expect(current_path).to eq '/instapics'
      expect(page).to have_content 'Brunch for dinner!'
      expect(page).to have_http_status(200)
    end
  end
end
