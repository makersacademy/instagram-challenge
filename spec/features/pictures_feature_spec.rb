require 'rails_helper'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start


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
      Picture.create name: 'Sunny'
      expect(page).to have_content 'Sunny'
      expect(current_path).to eq '/'
    end

  before {Picture.create name: 'Sunny'}

    scenario 'can delete a photo once up' do
      visit '/'
      click_link 'Delete Sunny'
      expect(page).not_to have_content 'Sunny'
    end

  end

end