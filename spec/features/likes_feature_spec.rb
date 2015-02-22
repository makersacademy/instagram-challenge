require 'rails_helper'

feature 'liking posts' do
	
	before do 
		pic = Post.create(name: 'Pic')
		pic.comments.create(thoughts: 'Awesome')
	end

	scenario 'a user can like a post/picture, which updates the post like count' do
		visit '/posts'
		click_link 'Like'
		expect(page).to have_content('1 like')
	end

end