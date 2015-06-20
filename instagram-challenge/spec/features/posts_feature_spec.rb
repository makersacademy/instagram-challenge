require 'rails_helper'

feature 'posts' do
	before do
		visit '/posts'
	end

	context 'no image posts have been added to site' do
		scenario 'should display a prompt to post an image' do
			expect(page).to have_content 'No posts yet'
			expect(page).to have_content 'New Post'
		end
	end

	context 'images have been posted to site' do
		before do
			Post.create(caption: 'Hello', image_file_name: 'some_image.jpg')
			visit '/posts'
		end

		scenario 'doesn\'t display \'no posts yet\' message' do
			expect(page).not_to have_content 'No posts yet'
		end

		scenario 'image captions are displayed on page' do
			expect(page).to have_content 'Hello'
		end

		scenario 'images are displayed on page' do
			expect(page).to have_selector 'img'
		end
	end

	context 'posting images' do
		scenario 'visitor is prompted to post image' do
			click_link 'New Post'
			expect(page).to have_content 'Add Post'
		end

		scenario 'visitor is able to post image to page' do
			click_link 'New Post'
			fill_in "Caption", with: "With my buddies"
			attach_file "Image", Rails.root.join("spec/features/test-image/mr-blobby.jpg")
			click_button 'Post'
			expect(page).to have_content 'With my buddies'
			expect(page).to have_selector 'img'
		end
	end
end