require 'rails_helper'

feature 'pictures' do

  context 'no picture comments have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      # need to change this to comments
      expect(page).to have_content 'No pictures added yet'
      expect(page).to have_link 'Add a picture'
    end
  end

# change pictures to comments instead
  context 'pictures have been added' do 

    before do
      Picture.create(name: 'LIKE')
    end

  scenario 'display picture comments' do
    visit '/pictures'
    expect(page).to have_content('LIKE')
    expect(page).not_to have_content('No pictures added yet')
    end
  end

  context 'creating pictures' do

    scenario 'prompts user to fill out a form, then displays the new picture comments' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Name', with: 'LIKE'
      click_button 'Create Picture'
      expect(page).to have_content 'LIKE'
      expect(current_path).to eq '/pictures'
     end
  end

  # context 'an invalid picture' do
  #   it 'does not let you submit a comment that is too short' do
  #     visit '/pictures'
  #     click_link 'Add a picture'
  #     fill_in 'Name', with: ''
  #     click_button 'Create Restaurant'
  #     expect(page).not_to have_css 'h2', text: 'kf'
  #     expect(page).to have_content 'error'
  #   end
  # end

  context 'viewing pictures' do

  let!(:like){Picture.create(name:'LIKE')}

    scenario 'lets a user view a picture' do
     visit '/pictures'
     click_link 'LIKE'
     expect(page).to have_content 'LIKE'
     expect(current_path).to eq "/pictures/#{like.id}"
    end
  end

  context 'editing picture' do

    before {Picture.create name: 'LIKE'}

    scenario 'let a user edit a picture' do
     visit '/pictures'
     click_link 'Edit LIKE'
     fill_in 'Name', with: 'COOL'
     click_button 'Update Picture'
     expect(page).to have_content 'COOL'
     expect(current_path).to eq '/pictures'
    end
  end

  context 'deleting picture' do

    before {Picture.create name: 'LIKE'}

    scenario 'removes a picture comment when a user clicks a delete link' do
      visit '/pictures'
      click_link 'Delete LIKE'
      expect(page).not_to have_content 'LIKE'
      expect(page).to have_content 'Picture deleted successfully'
    end
  end
end