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
      expect(page.find('img')['src']).to have_content('Honey_Roast_Ham_1.jpg')
    end
  end
end
