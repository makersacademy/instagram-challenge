require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'luni@cat.com')
    fill_in('Password', with: 'marley')
    fill_in('Password confirmation', with: 'marley')
    click_button('Sign up')

      expect(page).to have_content 'Welcome!'
      expect(page).to have_link 'Add your image here!'
    end
  end

end
