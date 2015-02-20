require 'rails_helper'

feature 'posts' do
	
	context 'no posts have been added' do

		scenario 'should display a prompt to add a post' do
			visit '/posts'
			expect(page).to have_content 'No posts'
			expect(page).to have_link 'Add a post'
		end
	end

	context 'posts have been added' do

		before do
			Post.create(name: 'Pic')
		end

		scenario 'display posts' do
			visit '/posts'
			expect(page).to have_content('Pic')
			expect(page).not_to have_content('No posts')
		end
		
	end

	context 'creating posts' do

		scenario 'prompts user to fill a form, then displays post' do
			visit '/posts'
			click_link 'Add a post'
			fill_in 'Name', with: 'Pic'
			fill_in 'Description', with: 'Nice Pic'
			click_button 'Create Post'
			expect(page).to have_content 'Pic'
			expect(current_path).to eq '/posts'
		end

	end

end