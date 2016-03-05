require 'rails_helper'

feature 'pictures' do 
	context 'no pictures have been added' do 
		scenario 'should display a prompt to add a picture' do 
			visit '/pictures'
			expect(page).to have_content 'No pictures yet'
			expect(page).to have_link 'Add a picture'
		end
	end

	context 'picture has been added' do 
		before do 
			Picture.create(name: 'Sunshine')
		end

		scenario 'display picture' do 
			visit '/pictures'
			expect(page).to have_content('Sunshine')
			expect(page).not_to have_content('No pictures yet')
		end
	end
	context 'add pictures' do
  scenario 'prompts user to fill the picture name, then displays it' do
    visit '/pictures'
    click_link 'Add a picture'
    fill_in 'Name', with: 'Sunshine'
    click_button 'Create Picture'
    expect(page).to have_content 'Sunshine'
    expect(current_path).to eq '/pictures'
  	end
	end
end
