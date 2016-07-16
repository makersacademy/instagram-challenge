require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'posts have been added' do
    before { Post.create(picture: 'PIC') }
    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('PIC')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to add a picture' do
      visit '/posts'
      click_link 'Add a picture'
      fill_in 'Picture', with: 'PIC'
      click_button 'Post'
      expect(page).to have_content 'PIC'
      expect(current_path).to eq '/posts'
    end
  end
end
