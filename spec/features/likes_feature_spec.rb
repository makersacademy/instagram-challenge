require 'spec_helper'

feature 'Like' do

  let!(:picture) { Picture.create(name: 'Love', description: 'Do you love me?') }

  before do
    visit '/'
    click_link 'Love'
    click_link 'Like'
  end


  context 'when no likes' do

    scenario 'can like a picture' do
      expect(page.current_path).to eq "/pictures/#{picture.id}"
      expect(page).to have_content '1 like'
    end

    scenario 'can like a picture multiple times' do
      click_link 'Like'
      expect(page).to have_content '2 likes'
    end

  end

  context 'when there are likes' do

    xscenario 'can delete a like' do
      click_link 'p#picture_likes'
      expect(page).not_to have_content '1 like'
    end
  end


end
