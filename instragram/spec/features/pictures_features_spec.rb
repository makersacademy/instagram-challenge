require 'rails_helper'
include ApplicationHelper

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
    # scenario 'upload a picture' do 
    #   sign_up
    #    visit '/pictures'
    #   click_link 'Add a picture'
    #   fill_in 'Name', with: 'Sunshine'
    #   click_link 'Choose File'
      
    #   click_button 'Create Picture'
    #   expect(page).to have_content 'Sunshine'
    #   expect(current_path).to eq '/pictures'

	end
	context 'add pictures' do
  scenario 'prompts user to fill the picture name, then displays it' do
    sign_up
    visit '/pictures'
    click_link 'Add a picture'
    fill_in 'Name', with: 'Sunshine'
    click_button 'Create Picture'
    expect(page).to have_content 'Sunshine'
    expect(current_path).to eq '/pictures'
  	end
	end
	context 'editing pictures' do

  before { Picture.create name: 'Sunshine' }

  scenario 'let a user edit a picture' do
    sign_up
   visit '/pictures'
   click_link 'Edit'
   fill_in 'Name', with: '#beach'
   click_button 'Update'
   expect(page).to have_content '#beach'
   expect(current_path).to eq '/pictures'
  end
  scenario 'removes a picture' do
    sign_up
    visit '/pictures'
    click_link 'Delete'
    expect(page).not_to have_content 'Sunshine'
    expect(page).to have_content 'Picture deleted successfully'
  end

   scenario 'allows users to tag using a form' do
     sign_up
     visit '/pictures'
     click_link 'Tag'
     fill_in "Tag", with: "#holidays"
     click_button 'Tag it'
     click_link 'Sunshine'
     expect(page).to have_content('#holidays')
  	end

  scenario 'allows users to leave a comment' do
      sign_up
     visit '/pictures'
     click_link 'Comment'
     fill_in "Comment", with: "nice one!"
     click_button 'leave comment'
     click_link 'Sunshine'
     expect(page).to have_content('nice one!')
  end

	end
end
