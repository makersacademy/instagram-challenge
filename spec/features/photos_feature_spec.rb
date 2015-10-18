require 'rails_helper'

feature 'photos' do 

  context 'no photos have been added' do 
    scenario 'should display a prompt to add a photo' do 
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Post a photo'
    end
  end  

  context 'photo have been added' do

  before do
    Photo.create(caption: 'sunrise')
  end

  scenario 'display photos' do
    visit '/photos'
    expect(page).to have_content('sunrise')
    expect(page).not_to have_content('No restaurants yet')
  end

end

end