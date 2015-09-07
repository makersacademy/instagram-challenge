require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to post a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'pictures have been posted' do
    before do
      Picture.create(title: 'Holiday')
  end

    scenario 'display pictures titles' do
      visit '/pictures'
      expect(page).to have_content('Holiday')
      expect(page).not_to have_content('No pictures yet')
    end

  end


end