require 'rails_helper'

feature 'posts' do
	context 'no image posts have been added to site' do
		scenario 'should display a prompt to post an image' do
			visit '/posts'
			expect(page).to have_content 'No posts yet'
			expect(page).to have_content 'Post Image'
		end
	end
end