require 'Rails_helper'

feature 'user can add a photo' do
	it'lets a user add a photo' do 
	visit('/')
	expect(page).to have_content('No photos added yet')
  expect(page).to have_link('Add a photo')
  end
end

feature 'user can add a photo' do
	it'lets a user add a photo' do 
	visit('/')
	click_link('Add a photo')
	expect(current_path).to eq('/photos/new')
	attach_file('photo[image]', "#{Rails.root}/spec/cat.jpg", visible: false)
	click_button('Create Photo')
	expect(page).to have_css("img[src*='cat.jpg']")
  end
end