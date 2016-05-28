require 'rails_helper'

feature 'posts' do
	before do
		visit '/'
		click_link 'Sign up'
		fill_in('Email', with: 'test@test.com')
		fill_in('Password', with: '123456')
		fill_in('Password confirmation', with: '123456')
		click_button('Sign up')
	end

	context 'creating posts' do
		scenario 'a user can post an image using the create post form on the homepage' do
			create_post
			expect(page).to have_css("img[src*='test.png']")
			remove_uploaded_file
		end
		scenario 'a user can add a caption when posting an image' do
			create_post
			expect(page).to have_content 'The best name ever'
			remove_uploaded_file
		end
		scenario 'a user cannot put an empty post on the feed' do
			create_post(image: nil)
			expect(page).to have_content 'You have to post a picture!'
			expect(current_path).to eq '/posts/new'
			remove_uploaded_file
		end
		scenario 'a user cannot post an image if they are not signed in' do
			click_link 'Sign out'
			visit '/posts'
			click_link 'New post'
			expect(page).not_to have_content 'Post image'
			expect(current_path).to eq '/users/sign_in'
		end
	end

	context 'deleting posts' do
		scenario 'a user can delete a post they created' do
			create_post
			click_link 'My posts'
			click_link 'Delete post'
			visit('/posts')
			expect(page).not_to have_css("img[src*='test.png']")
			expect(page).not_to have_content 'The best name ever'
			remove_uploaded_file
		end
		scenario 'a user cannot delete a post they did not create' do
			create_post
			click_link('Sign out')
			click_link('Sign up')
			fill_in('Email', with: 'test2@test.com')
			fill_in('Password', with: '123456')
			fill_in('Password confirmation', with: '123456')
			click_button('Sign up')
			click_link("test@test.com")
			expect(page).not_to have_link('Delete post')
			# click_link('Delete post')
			# expect(page).to have_content("That post isn't yours")
			# visit('/posts')
			# expect(page).to have_css("img[src*='test.png']")
			# remove_uploaded_file
		end
	end


end