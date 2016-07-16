require 'rails_helper'

feature 'comments' do
	before :each do
		visit '/posts'
		click_on 'Add a post!'
		fill_in 'post_description', with: 'When we were at Germany!'
		attach_file('post_image', Rails.root + "spec/fixtures/test_image.jpg")
		click_on 'Create Post'
	end

	scenario 'allows user to leave a comment on the post' do
		click_link 'Comment'
		fill_in 'Comment', with: 'Great picture guys!'
		click_button 'Submit'
		expect(page).to have_content('Great picture')
	end
end
