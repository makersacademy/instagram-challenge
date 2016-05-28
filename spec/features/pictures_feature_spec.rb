require 'rails_helper'

feature 'Pictures' do

  describe 'no pictures have been added' do
    it 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures here 😳'
      expect(page).to have_link 'Add a picture'
    end
  end

  describe 'adding pictures' do
    it 'prompts user to upload a picture, then displays the new picture' do
    visit '/pictures'
    click_link 'Add a picture'
    attach_file :picture_image, "./spec/images/succulents.jpg"
    fill_in 'Description', with: '#sweetsucculents'
    click_button 'Post'
    expect(page).to have_content '#sweetsucculents'
    expect(page).to have_css "img[src*=succulents]"
    expect(current_path).to eq '/pictures'
    end
  end




end
