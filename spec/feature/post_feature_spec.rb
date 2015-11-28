require 'rails_helper'

feature 'post pictures' do
  context 'no post pictures have been added' do
    scenario 'should display a prompt to add a post picture' do
      visit '/posts'
      expect(page).to have_content 'No post pictures yet'
      expect(page).to have_link 'Add a post picture'
    end
  end
  context 'picture posts have been added' do
  before do
    Post.create(caption: 'big ass cakes')
  end

    scenario 'display picture posts' do
      visit '/posts'
      expect(page).to have_content('big ass cakes')
      expect(page).not_to have_content('No post pictures yet')
    end
  end

end