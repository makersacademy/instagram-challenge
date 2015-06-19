require 'rails_helper'

feature 'posts' do
	context 'no image posts have been added to site' do
		scenario 'should display a prompt to post an image' do
			visit '/posts'
			expect(page).to have_content 'No posts yet'
			expect(page).to have_content 'Post Image'
		end
	end

	context 'images have been posted to site' do
		scenario 'doesn\'t display \'no posts yet\' message' do
			Post.create
			visit '/posts'
			expect(page).not_to have_content 'No posts yet'
		end

		scenario 'image captions are displayed on page' do
			Post.create(caption: 'Hello')
			visit '/posts'
			expect(page).to have_content 'Hello'
		end
	end
end