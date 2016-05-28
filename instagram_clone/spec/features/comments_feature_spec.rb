require 'rails_helper'

feature 'comments' do
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

	context 'adding comments' do
		scenario "a signed in user can add a comment to a post via the post feed" do
			create_post
			visit '/posts'
			add_comment
			expect(page).to have_content 'My comment'
			visit('/posts')
			expect(page).to have_content 'My comment'
		end
		scenario "a signed in user can add a comment to a post via a user page" do
			create_post
			click_link('My posts')
			add_comment
			expect(page).to have_content 'My comment'
			visit('/posts')
			expect(page).to have_content 'My comment'
		end
		scenario 'a non-signed in user cannot add a comment' do
			create_post
			click_link 'Sign out'
			visit '/posts'
			add_comment
			expect(current_path).to eq '/users/sign_in'
			visit '/posts'
			expect(page).not_to have_content 'My comment'
		end
	end

	context 'deleting comments' do
		scenario "a user can remove a comment they added via the post's indiviual page" do
			create_post
			click_link('My posts')
			add_comment
			click_link('Delete comment')
			expect(page).not_to have_content 'My comment'
			visit('/posts')
			expect(page).not_to have_content 'My comment'
		end
		scenario "a user can remove a comment they added via the post feed" do
			create_post
			click_link('My posts')
			add_comment
			visit '/posts'
			click_link('Delete comment')
			expect(page).not_to have_content 'My comment'
			visit('/posts')
			expect(page).not_to have_content 'My comment'
		end
		scenario "a user can remove a comment they added via a user page" do
			create_post
			click_link('My posts')
			add_comment
			click_link('My posts')
			click_link('Delete comment')
			expect(page).not_to have_content 'My comment'
			visit('/posts')
			expect(page).not_to have_content 'My comment'
		end
		scenario 'a user cannot remove a comment someone else added' do
			create_post
			click_link('My posts')
			add_comment
			click_link('Sign out')
			click_link 'Sign up'
			fill_in('Email', with: 'test2@test.com')
			fill_in('Password', with: '123456')
			fill_in('Password confirmation', with: '123456')
			click_button('Sign up')
			visit '/posts'
			click_link('Delete comment')
			expect(page).to have_content 'My comment'
			expect(page).to have_content "That comment isn't yours"
		end
	end

end