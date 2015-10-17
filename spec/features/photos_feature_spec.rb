require 'rails_helper'

describe 'Photos' do

  context 'no photos added' do

    scenario 'advises no photos added with link to add new' do
      visit '/photos'
      expect(page).to have_content 'No photos to show'
      expect(page).to have_link 'Post new pic'
    end

  end

end