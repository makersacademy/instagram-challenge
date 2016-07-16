require 'rails_helper'

feature 'posts' do
	context 'no posts have been added' do
		scenario 'should display a prompt to add a post' do
			visit '/posts'
			expect(page).to have_link 'Add a post!'
		end
	end

	context 'posts added without pictures' do
		before :each do
			visit '/posts'
			click_on 'Add a post!'
		end

		scenario 'should display a photo description' do
			fill_in 'post_description', with: 'When we were at Turkey!'
			click_on 'Create Post'
			expect(page).to have_content 'When we were at Turkey!'
		end
	end

	context 'posts added with pictures' do
		before :each do
			visit '/posts'
			click_on 'Add a post!'
		end

		scenario 'should display a photo with description' do
			fill_in 'post_description', with: 'When we were at Germany!'
			attach_file('post_image', Rails.root + "spec/fixtures/test_image.jpg")
			click_on 'Create Post'
			expect(page).to have_selector('img')
		end

	end
end
