require 'rails_helper'

feature 'comments' do
  before { Picture.create(description:'New picture') }
  context 'user can add comments to the picture' do
    scenario 'allows user to leave a comment' do
      visit 'pictures'
      click_link 'Comment on New picture'
      fill_in 'Thoughts', with: 'love the picture'
      click_button 'Leave Comment'

      expect(current_path).to eq '/pictures'
      expect(page).to have_content 'love the picture'
    end
  end
end
