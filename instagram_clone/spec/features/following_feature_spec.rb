require 'rails_helper'

feature 'following' do
	before do
		visit '/'
		click_link 'Sign up'
		fill_in('Email', with: 'test@test.com')
		fill_in('Password', with: '123456')
		fill_in('Password confirmation', with: '123456')
		click_button('Sign up')
	end
	after do
		remove_uploaded_file
	end

	context 'viewing a list of users' do
		scenario 'at the user index page a user should see all users' do
			visit '/'
			click_link 'Sign out'
			click_link 'Sign up'
			fill_in('Email', with: 'test2@test.com')
			fill_in('Password', with: '123456')
			fill_in('Password confirmation', with: '123456')
			click_button('Sign up')
			click_link 'View users'
			expect(current_path).to eq '/users'
			expect(page).to have_content('test@test.com')
			expect(page).to have_content('test2@test.com')
		end
	end

	context 'following a user' do
		scenario 'a user can click to follow a user then see their posts in the feed' do
			visit '/'
			create_post
			click_link 'Sign out'
			click_link 'Sign up'
			fill_in('Email', with: 'test2@test.com')
			fill_in('Password', with: '123456')
			fill_in('Password confirmation', with: '123456')
			click_button('Sign up')
			create_post(caption: 'Post I am not interested in')
			click_link 'Sign out'
			click_link 'Sign up'
			fill_in('Email', with: 'test3@test.com')
			fill_in('Password', with: '123456')
			fill_in('Password confirmation', with: '123456')
			click_button('Sign up')
			click_link 'View users'
			user = User.find_by(email: 'test@test.com')
			click_link('Follow', href: "/users/#{user.id}/follow")
			visit('/my_feed')
			expect(page).to have_content('The best name ever')
			expect(page).not_to have_content('Post I am not interested in')
		end
		scenario 'a user cannot click to follow a user they are already following' do
			visit '/'
			click_link 'Sign out'
			click_link 'Sign up'
			fill_in('Email', with: 'test2@test.com')
			fill_in('Password', with: '123456')
			fill_in('Password confirmation', with: '123456')
			click_button('Sign up')
			click_link 'View users'
			user = User.find_by(email: 'test@test.com')
			click_link('Follow', href: "/users/#{user.id}/follow")
			click_link 'View users'
			expect(page).not_to have_link('Follow', href: "/users/#{user.id}/follow")
		end
	end

	context 'unfollowing a user' do
		scenario 'a user can unfollow a user they are following' do
			visit '/'
			create_post
			click_link 'Sign out'
			click_link 'Sign up'
			fill_in('Email', with: 'test2@test.com')
			fill_in('Password', with: '123456')
			fill_in('Password confirmation', with: '123456')
			click_button('Sign up')
			create_post(caption: 'Post I am not interested in')
			click_link 'Sign out'
			click_link 'Sign up'
			fill_in('Email', with: 'test3@test.com')
			fill_in('Password', with: '123456')
			fill_in('Password confirmation', with: '123456')
			click_button('Sign up')
			click_link 'View users'
			user = User.find_by(email: 'test@test.com')
			click_link('Follow', href: "/users/#{user.id}/follow")
			click_link 'View users'
			click_link('Unfollow', href: "/users/#{user.id}/unfollow")
			visit('/my_feed')
			expect(page).not_to have_content('The best name ever')
			expect(page).not_to have_content('Post I am not interested in')
		end
	end

	context 'seeing followers and who you are following' do
		scenario 'a user can click in a profile to see the users that person is following' do
			visit '/'
			click_link 'Sign out'
			click_link 'Sign up'
			fill_in('Email', with: 'test2@test.com')
			fill_in('Password', with: '123456')
			fill_in('Password confirmation', with: '123456')
			click_button('Sign up')
			click_link 'View users'
			user = User.find_by(email: 'test@test.com')
			click_link('Follow', href: "/users/#{user.id}/follow")
			click_link 'My posts'
			click_link 'Following'
			expect(page).to have_content('test@test.com')
		end
		scenario 'a user can click in a profile to see the users that person is followed by' do
			visit '/'
			click_link 'Sign out'
			click_link 'Sign up'
			fill_in('Email', with: 'test2@test.com')
			fill_in('Password', with: '123456')
			fill_in('Password confirmation', with: '123456')
			click_button('Sign up')
			click_link 'View users'
			user = User.find_by(email: 'test@test.com')
			click_link('Follow', href: "/users/#{user.id}/follow")
			click_link 'Sign out'
			click_link 'Sign in'
			fill_in('Email', with: 'test@test.com')
			fill_in('Password', with: '123456')
			click_button('Log in')
			click_link 'My posts'
			click_link 'Followers'
			expect(page).to have_content('test2@test.com')
		end
	end


end
