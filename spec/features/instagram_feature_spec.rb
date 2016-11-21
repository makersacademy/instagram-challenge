require 'rails_helper'

describe 'instagram' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Show everyone how great your life is'
    end
  end

  context 'photos have been added' do
    scenario 'display posts' do
      add_post
      visit '/photos'
      expect(page).to have_content 'Check out my sepia food'
      expect(page).not_to have_content 'No photos yet'
    end
  end

  context 'creating photos' do
    scenario 'prompts user to fill out a form, then displays new photo post' do
      add_post
      expect(page).to have_content 'Check out my sepia food'
      expect(current_path).to eq '/photos'
    end
  end

  context 'viewing posts' do

    scenario 'view a post' do
      add_post
      expect(page.find('img')['src']).to have_content 'Honey_Roast_Ham_1.jpg'
    end

    scenario 'lets a user view a post' do
      add_post
      click_link 'Check out my sepia food'
      expect(page.find('img')['src']).to have_content 'Honey_Roast_Ham_1.jpg'
      expect(page).to have_content 'Check out my sepia food'
    end
  end

  context 'editing posts' do

    scenario 'let a user edit a post' do
      add_post
      visit '/photos'
      click_link 'Check out my sepia food'
      click_link 'Edit post'
      fill_in 'Title', with: 'Actually, I forgot the filter'
      click_button 'Update'
      expect(page).to have_content 'Actually, I forgot the filter'
      expect(current_path).to eq '/photos'
    end
  end

  context 'deleting posts' do

    scenario 'removes a post when a user clicks a delete link' do
      add_post
      visit '/photos'
      click_link 'Check out my sepia food'
      click_link 'Delete post'
      expect(page).not_to have_content 'Check out my sepia food'
      expect(page).to have_content 'Post deleted successfully'
    end

  end

end
