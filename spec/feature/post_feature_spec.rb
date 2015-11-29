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

    let!(:caption){Post.create(caption:'big ass cakes')}

    scenario 'lets a user view a post' do
       visit '/posts'
       click_link 'big ass cakes'
       expect(page).to have_content 'big ass cakes'
       expect(current_path).to eq "/posts/#{big ass cakes.id}"
    end

  end

end