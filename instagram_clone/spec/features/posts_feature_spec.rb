require 'rails_helper'

feature 'posts' do

	context 'create posts' do

		scenario 'a user can post an image using the create post form on the homepage' do
			visit '/posts'
			click_link 'New post'
			attach_file('Image', image_upload)
			click_button 'Post image'
			expect(page).to have_css("img[src*='test.png']")
			remove_uploaded_file
		end

	end

end