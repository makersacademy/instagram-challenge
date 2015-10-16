require 'rails_helper'

feature 'commenting' do
  before do
    visit '/pictures'
    click_link 'Add a picture'
    attach_file('Picture', './spec/fixtures/associations.jpg')
    fill_in 'Description', with: 'Nice'
    click_button 'Post'
  end

  context 'creating a comment' do
    scenario 'users can add a comment to a picture' do
      visit '/pictures'
      click_link 'Create comment'
      fill_in 'Content', with: 'Great'
      click_button 'Comment'
      expect(page).to have_content 'Great'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'deleting a comment' do
    before do
      visit '/pictures'
      click_link 'Create comment'
      fill_in 'Content', with: 'Great'
      click_button 'Comment'
    end
    scenario 'users can delete a comment' do
      visit '/pictures'
      click_link 'Delete this comment'
      expect(page).not_to have_content 'Great'
    end
  end
end
