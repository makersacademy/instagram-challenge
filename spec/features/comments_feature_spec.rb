require 'rails_helper'

feature 'commenting' do

  context 'creating a comment' do
    before do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file('Picture', './spec/fixtures/associations.jpg')
      fill_in 'Description', with: 'Nice'
      click_button 'Post'
    end
    scenario 'users can add a comment to a picture' do
      visit '/pictures'

      click_link 'Create comment'
      fill_in 'Content', with: 'Great'
      click_button 'Comment'
      expect(page).to have_content 'Great'
      expect(current_path).to eq '/pictures'
    end
  end
end
