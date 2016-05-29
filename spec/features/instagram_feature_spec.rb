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
    before do
      Photo.create(title: 'Check out my sepia food')
    end
    scenario 'display posts' do
      visit '/photos'
      expect(page).to have_content 'Check out my sepia food'
      expect(page).not_to have_content 'No photos yet'
    end
  end

  context 'creating photos' do
    scenario 'prompts user to fill out a form, then displays new photo post' do
      visit '/photos'
      click_link 'Show everyone how great your life is'
      fill_in 'Title', with: 'Check out my sepia food'
      click_button 'Post photo / fill the yawning void'
      expect(page).to have_content 'Check out my sepia food'
      expect(current_path).to eq '/photos'
    end
  end

  context 'viewing posts' do
    scenario 'view a post' do
      visit '/photos'
      click_link 'Show everyone how great your life is'
      fill_in 'Title', with: 'Check out my sepia food'
      page.attach_file('Image', Rails.root + 'public/system/photos/images/Honey_Roast_Ham_1.jpg')
      expect(page).to have_xpath("//img[@src=\"/public/system/photos/images/Honey_Roast_Ham_1.jpg\"]")
    end
  end
end
