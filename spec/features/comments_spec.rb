require "rails_helper"

feature 'leaving comments' do
  context ' allows a user to leave a comment' do
    before do
      Picture.create(title: 'cute dog', filename: 'dogthinkstock.jpg')
    end
    scenario ' a user can fill in a form to leave a comment' do
      visit '/pictures'
      click_link 'cute dog'
      click_link 'Add comment'
      fill_in 'Thoughts', with: 'Aw cute'
      click_button 'Save comment'
      expect(page).to have_content('Aw cute')
    end
  end

end
