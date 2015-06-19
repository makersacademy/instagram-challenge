require 'rails_helper'

feature 'liking images' do
	context 'no images have been posted' do
		scenario 'visitor is not able to like an image that does not exist' do
			visit '/posts'
			expect(page).not_to have_content '❤'
		end
	end

	context 'images have been posted' do
		scenario 'visitor can like an image' do
			visit '/posts'
			click_link 'New Post'
			fill_in "Caption", with: "With my buddies"
			attach_file "Image", "spec/features/test-image/mr-blobby.jpg"
			click_button 'Post'
			click_link '❤'
			expect(page).to have_content '❤ 1'
		end
	end
end