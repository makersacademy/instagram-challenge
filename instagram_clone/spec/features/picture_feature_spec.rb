require 'rails_helper'

feature 'Pictures:' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content "You don't have any pictures yet"
      expect(page).to have_link 'Upload a picture'
    end
  end

  context 'uploading pictures' do
    scenario 'prompts user to fill out a form, then displays the new picture' do
      visit '/'
      click_link 'Upload a picture'
      fill_in 'Title', with: 'Summer 68'
      fill_in 'Description', with: 'Summer 68'
      click_button 'Upload Picture'
      expect(page).to have_content 'Summer 68'
      # expect(page).to have_css('img src="/system/pictures/images/000/000/003/thumb/Summer_68.jpg?1479666116" alt="Kyoto1"')
      expect(current_path).to eq '/'
    end
  end

  context 'viewing pictures' do

    let!(:pic){ Picture.create(title:'Summer 96') }

    scenario 'should display pictures' do
      visit '/'
      expect(page).to have_content 'Summer 96'
    end

    scenario 'lets a user view a pic' do
     visit '/'
     click_link 'Summer 96'
     expect(page).to have_content 'Summer 96'
     expect(current_path).to eq "/pictures/#{pic.id}"
    end


  end
end
