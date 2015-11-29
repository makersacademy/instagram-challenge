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

  context 'creating caption for picture posts' do
    scenario 'prompts user to fill out a form, then displays the new caption' do
      visit '/posts'
      click_link 'Add a post picture'
      fill_in 'Caption', with: 'big ass cakes'
      click_button 'Create Post'
      expect(page).to have_content 'big ass cakes'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

    let!(:big){Post.create(caption:'big ass cakes')}

    scenario 'lets a user view a post' do
       visit '/posts'
       click_link 'big ass cakes'
       expect(page).to have_content 'big ass cakes'
       expect(current_path).to eq "/posts/#{big.id}"
    end

  end

  context 'editing posts' do

    before { Post.create caption: 'big ass cakes' }

    scenario 'let a user edit a post' do
       visit '/posts'
       click_link 'Edit big ass cakes'
       fill_in 'Caption', with: 'Enormous buns'
       click_button 'Update Post'
       expect(page).to have_content 'Enormous buns'
       expect(current_path).to eq '/posts'
    end

  end

  context 'deleting posts' do

    before {Post.create caption: 'big ass cakes'}

    scenario 'removes a post when a user clicks a delete link' do
      visit '/posts'
      click_link 'Delete big ass cakes'
      expect(page).not_to have_content 'big ass cakes'
      expect(page).to have_content 'Caption deleted successfully'
    end

  end

end