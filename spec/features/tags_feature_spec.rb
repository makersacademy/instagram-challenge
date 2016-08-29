require 'rails_helper'
require 'features/feature_spec_helper'

feature 'tags' do
  before do
    sign_up
    new_post
  end

  context 'a user adds a #tag to a post' do
    scenario 'a user can then filter posts by the tag' do
      visit posts_path
      click_link 'New Post'
      fill_in 'Caption', with: 'Mmm Dumpling'
      click_button 'Create Post'
      fill_in 'search', with: 'queenstown'
      click_button 'search-btn'
      expect(page).to have_content('Amazing. #jackspoint #queenstown')
      expect(page).to_not have_content('Mmm Dumpling')
    end
  end

end
