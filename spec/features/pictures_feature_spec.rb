require 'rails_helper'

feature 'pictures' do

  before do
    visit '/'
    click_link 'Sign up'
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button 'Sign up'
  end
  
  context 'no pictures have been added' do

    scenario 'should display a prompt to add a picture' do
      visit '/'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end

  end

  context 'creating pictures' do
    
    scenario 'prompts user to fill out a form, then displays the new picture' do
      visit '/'
      click_link 'Add a picture'
      fill_in 'Name', with: 'Sunny'
      click_button 'Create Picture'
      expect(page).to have_content 'Sunny'
      expect(current_path).to eq '/'
    end

end


end