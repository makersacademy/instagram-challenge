require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'create posts' do
    scenario 'uploads a picture' do
      visit '/posts'
      click_link 'Add a picture'
      attach_file "Image", "./docs/testing.jpg"
      fill_in 'Title', with: 'PIC'
      click_button 'Post'
      expect(page).to have_content 'PIC'
      expect(current_path).to eq '/posts'
    end

    scenario 'prompts user to add a picture' do
    end
  end
end
