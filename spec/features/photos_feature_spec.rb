require 'rails_helper'

feature 'Photos' do

  context 'no photos have been added' do

    it 'should display a prompt to add a photo' do
      visit '/photos'
      click_link 'Sign up'
      fill_in 'Email', with: "test@hotmail.com"
      fill_in 'Password', with: "123456"
      fill_in 'Password confirmation', with: "123456"
      click_button 'Sign up'
      expect(page).to(have_content("No photos yet"))
      expect(page).to(have_link("Add a photo"))
    end

  end
