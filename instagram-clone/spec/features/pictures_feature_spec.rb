require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been posted' do

    scenario 'should display a prompt to post a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet!'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'posting a picture' do

    scenario 'prompts the user to fill out a form, them displays the new picture' do
      visit '/pictures'
      click_link 'Post a picture'
      fill_in 'Name your picture...', with: 'Beach jumping!'
      click_button 'Post'
      expect(page).to have_content 'Beach jumping!'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'pictures have been posted' do

    before do
      Picture.create(name: 'Beach jumping!', description: 'Jumping on a beach!')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('Beach jumping!')
      expect(page).not_to have_content('No pictures yet!')
    end

    scenario 'display descriptions' do
      visit '/pictures'
      expect(page).to have_content('Jumping on a beach!')
    end
  end
end
