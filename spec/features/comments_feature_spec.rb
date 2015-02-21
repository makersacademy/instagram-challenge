require 'rails_helper'

feature 'commenting' do
	before {Post.create name: 'Pic'}

	scenario 'allows users to leave a comment' do
		visit '/posts'
		click_link 'Comment'
		fill_in "Thoughts", with: "Nice"
		click_button 'Leave Comment'
		expect(current_path).to eq '/posts'
		expect(page).to have_content "Nice"
	end

	scenario 'comment is deleted if post is deleted' do
		visit '/posts'
		click_link 'Comment'
		fill_in "Thoughts", with: "Nice"
		expect(page).to have_content "Nice"
		click_button 'Leave Comment'
		click_link 'Delete Pic'
		expect(page).not_to have_content "Nice"
	end

end