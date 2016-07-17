require 'rails_helper'

feature 'pictures' do
	
	context 'no pictures have been added' do
		scenario 'should display a prompt to add a picture' do
			visit pictures_path
			expect(page).to have_link 'Add a Picture'
			expect(page).to have_content 'No pictures yet!'
		end
	end

	context 'user has signed up and added a photo' do
		before do
			sign_up
			add_picture
		end
		scenario 'displays pictures' do
			visit '/'
			expect(page).to have_content('Test Caption')
			expect(page).not_to have_content('No pictures yet')
		end
	end

end