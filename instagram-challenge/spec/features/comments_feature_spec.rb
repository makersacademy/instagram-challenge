require 'rails_helper'

feature 'adding comments' do
	before do
		visit '/posts'
	end

	context 'no images have been posted' do
		scenario 'visitor is not able to comment on an image that does not exist' do
			expect(page).not_to have_content '✎'
		end
	end

	context 'images have been posted' do
		it 'visitor can comment on an image and their comment will appear on page' do
			click_link 'New Post'
			fill_in "Caption", with: "With my buddies"
			attach_file "Image", "spec/features/test-image/mr-blobby.jpg"
			click_button 'Post'
			expect(page).to have_content '✎'
			click_link '✎'
			fill_in "✎", with: "Looking coooool"
			click_button 'Post'
			expect(page).to have_content 'Looking coooool'
		end
	end
end