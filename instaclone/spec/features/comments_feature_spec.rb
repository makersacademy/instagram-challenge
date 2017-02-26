require 'rails_helper'

feature 'commenting' do

  context 'user can leave a comment on a photo' do
    before do
      @mountains = Photo.create(caption:'mountains.jpg')
    end

    scenario 'allows users to comment on a photo' do
      visit '/photos'
      click_link "Comment on mountains"
      fill_in 'Thoughts', with: 'cool!'
      click_button 'Create Comment'
      expect(page).to have_content('cool!')
      click_link 'Delete mountains'
      expect(page).to have_content 'Photo deleted successfully'
    end
  end
end
