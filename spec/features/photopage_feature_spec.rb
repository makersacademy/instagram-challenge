require 'rails_helper'

feature 'photos' do
  context 'no pictures have been added' do
    scenario 'should display prompt to add photos' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'add a post'
    end
  end

end
