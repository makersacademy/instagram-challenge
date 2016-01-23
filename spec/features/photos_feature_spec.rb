require 'rails_helper'

describe 'photo features' do

  feature 'adding photos' do
    context 'no photos have been added' do
      scenario 'should display a prompt to add a photo' do
        visit '/photos'
        expect(page).to have_content 'No photos yet'
        expect(page).to have_link 'Upload a photo'
      end
    end
  end
end 
