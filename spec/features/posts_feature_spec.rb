require 'rails_helper'

feature 'Instagramclone posts' do
  context 'no posts yet' do
    scenario 'should diplay button for new posts' do
      visit '/posts'
      expect(page).to have_link 'New Post'
    end
  end

end
