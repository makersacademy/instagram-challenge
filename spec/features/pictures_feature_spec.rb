require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(caption: 'a nice picture', image: File.new(Rails.root.join('spec','images','img.jpg')))
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('a nice picture')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'posting pictures' do
    scenario 'prompts user to fill out a form, then displays the new picture' do
      visit '/pictures'
      click_link 'Post a picture'
      attach_file 'picture[image]', Rails.root.join('spec','images','img.jpg')
      fill_in 'Caption', with: 'a nice picture'
      click_button 'Post picture'
      expect(page).to have_content 'a nice picture'
      expect(current_path).to eq '/pictures'
    end
  end
end