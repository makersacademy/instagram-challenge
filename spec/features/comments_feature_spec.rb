require 'rails_helper'

feature 'comments' do
	before :each do
		sign_up
		add_post
	end

	scenario 'allows user to leave a comment on the post' do
		click_link 'Comment'
		fill_in 'Comment', with: 'Great picture guys!'
		click_button 'Submit'
		expect(page).to have_content('Great picture')
	end

	scenario 'displays the email address of the commenter' do
		click_link 'Comment'
		fill_in 'Comment', with: 'Great picture guys!'
		click_button 'Submit'
		expect(page).to have_content('poster@example.com says: Great picture guys!')
	end
end
