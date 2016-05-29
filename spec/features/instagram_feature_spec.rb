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
end
