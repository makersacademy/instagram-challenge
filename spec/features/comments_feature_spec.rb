require 'rails_helper'

feature 'commenting' do
	
	before do
		sign_up
		add_picture
	end

	scenario 'user can add a comment to a photo' do
		visit ('/')
		click_link 'Add Comment'
		fill_in 'Thoughts', with: 'Test Comment'
		click_button 'Add Comment'
		expect(page).to have_content('Test Comment')
	end
	
end