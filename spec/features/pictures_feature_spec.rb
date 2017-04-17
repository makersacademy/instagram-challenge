require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'creating pictures' do
    scenario 'prompts user to fill out a form, then displays the new picture' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Name', with: 'NCFC'
      click_button 'Create Picture'
      expect(page).to have_content 'NCFC'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(name: 'NCFC')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('NCFC')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'viewing pictures' do
    let!(:ncfc){Picture.create(name:'NCFC')}

    scenario 'lets a user view a picture' do
     visit '/pictures'
     click_link 'NCFC'
     expect(page).to have_content 'NCFC'
     expect(current_path).to eq "/pictures/#{ncfc.id}"
    end
  end

  context 'editing pictures' do
    before { Picture.create name: 'NCFC' }

    scenario 'let a user edit a picture' do
     visit '/pictures'
     click_link 'Edit NCFC'
     fill_in 'Name', with: 'Norwich City Football Club'
     click_button 'Update Picture'
     expect(page).to have_content 'Norwich City Football Club'
     expect(current_path).to eq '/pictures'
    end
  end

  context 'deleting pictures' do
    before {Picture.create name: 'NCFC'}

    scenario 'removes a picture when a user clicks a delete link' do
      visit '/pictures'
      click_link 'Delete NCFC'
      expect(page).not_to have_content 'NCFC'
      expect(page).to have_content 'Picture deleted successfully'
    end
  end
end