require 'rails_helper'

feature 'posts' do
  context 'no restaurant has been added' do
    scenario 'displays a prompt to add a restaurant' do
      visit '/insta_posts'
      expect(page).to have_content 'Add a post'

    end
  end
end
