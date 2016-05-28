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

	context 'adding comments' do
		scenario "a user can add a comment to a post via the post feed" do
			create_post
			visit '/posts'
			post = Post.find_by(caption: 'The best name ever')
			click_link('pic'+post.id.to_s)
			fill_in('Comment', with: 'My comment')
			click_button('Add comment')
			expect(page).to have_content 'My comment'
			visit('/posts')
			expect(page).to have_content 'My comment'
		end
		scenario "a user can add a comment to a post via a user page" do
			create_post
			click_link('My posts')
			post = Post.find_by(caption: 'The best name ever')
			click_link('pic'+post.id.to_s)
			fill_in('Comment', with: 'My comment')
			click_button('Add comment')
			expect(page).to have_content 'My comment'
			visit('/posts')
			expect(page).to have_content 'My comment'
		end


	end
end