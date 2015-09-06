require 'rails_helper'

feature 'comments' do 
	before do 
    visit '/posts'
    click_link 'Add a post'
    fill_in 'Title', with: 'Sunset'
    attach_file 'Image', 'spec/images/test_pic.jpeg'
    click_button 'Create Post'
  end

	context 'add comment' do
		scenario 'allow user to leave comments' do
			visit '/posts' 
			click_link 'Add a comment' 
			fill_in 'Thoughts', with: 'Looks great!'
			click_button 'Leave Comment'
			expect(current_path).to eq '/posts'
			expect(page).to have_content 'Looks great!'
		end 
	end 

	context 'delete comment' do
		# scenario 'when a post is deleted, the comments are deleted too' do 
		# 	visit '/posts' 
		# 	click_link 'Add a comment' 
		# 	fill_in 'Thoughts', with: 'Looks great!'
		# 	click_button 'Leave Comment'
		# 	visit '/posts/1'
		# 	click_link 'Delete Sunset'
		# 	expect(page).not_to have_content 'Looks great!'
		# 	expect(page).to have_content 'Post deleted successfully'
		# end 

		# scenario 'user should be able to delete their own comments' do 
		# 	visit '/posts' 
		# 	click_link 'Add a comment' 
		# 	fill_in 'Thoughts', with: 'Looks great!'
		# 	click_button 'Leave Comment'
		# 	click_link 'Delete'
		# 	expect(page).not_to have_content 'Looks great!'
		# 	expect(page).to have_content 'Comment deleted successfully'
		# end 
	end 
end 