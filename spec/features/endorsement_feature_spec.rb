require 'rails_helper'

feature 'endorsing posts' do
	before do
		sign_up
		add_post
	end

	scenario 'a user can endorse a post, which increments the endorsement count', js: true do
		visit '/'
		click_link('heart_link')
		expect(page).to have_content('1')
	end


end
