require 'Rails_helper'

feature 'user can add a photo' do
	it'lets a user add a photo' do 
	visit('/')
	expect(page).to have_content('No photos added yet')
  expect(page).to have_link('Add a photo')
  end
end