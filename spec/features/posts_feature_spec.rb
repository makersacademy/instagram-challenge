require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to post a photo' do
      visit 'posts/index'
      expect(page).to have_content 'No dogs yet'
      expect(page).to have_link 'Post a photo'
    end
  end
end
