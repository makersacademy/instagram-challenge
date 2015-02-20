require 'rails_helper'

feature 'pictures' do
  
  context 'no pictures have been added' do

  before do
    visit '/'
    click_link 'Sign up'
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button 'Sign up'
  end

    scenario 'should display a prompt to add a picture' do
      visit '/'
      expect(page).to have_content 'No pictures'
      expect(page).to have_link 'Add a picture'
    end

  end

end