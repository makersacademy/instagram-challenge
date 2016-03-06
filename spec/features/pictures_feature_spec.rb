require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(postcomment: 'My first pic')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('My first pic')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'creating pictures' do
  scenario 'prompts user to fill out a form, then displays the new picture' do
    visit '/pictures'
    click_link 'Add a picture'
    fill_in 'picture[postcomment]', with: 'My first selfie'
    click_button 'Create Picture'
    expect(page).to have_content 'My first selfie'
    expect(current_path).to eq '/pictures'
  end
end

context 'editing pictures' do

  before { Picture.create postcomment: 'Another pic' }

  scenario 'let a user edit a picture' do
   visit '/pictures'
   click_link 'Edit Picture'
   fill_in 'picture[postcomment]', with: 'Another great pic'
   click_button 'Update Picture'
   expect(page).to have_content 'Another great pic'
   expect(current_path).to eq '/pictures'
  end

end

end
