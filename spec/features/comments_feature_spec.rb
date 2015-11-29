require 'rails_helper'

feature 'Commenting' do
	scenario 'allows a user to leave a comment' do
		sign_up("test@test.com", "password")
		add_post
		add_comment
		expect(current_path).to eq '/posts'
	end

	scenario 'display comments' do
		sign_up("test@test.com", "password")
		add_post
		add_comment
		click_link 'Sunset'
		expect(page).to have_content('Sunset')
		expect(page).to have_content('Nice Photo')
	end

	context 'editing a comment' do
		scenario 'as the creator' do
			sign_up("test@test.com", "password")
			add_post
			add_comment
			click_link 'Sunset'
			click_link 'Edit Comment'
			fill_in 'Message', with: 'Great Sunset'
			click_button 'Send'
			click_link 'Sunset'
			expect(page).not_to have_content 'Nice Photo'
			expect(page).to have_content 'Great Sunset'
		end

	  scenario 'not as the creator' do
	    sign_up("test@test.com", "password")
			add_post
			add_comment
	    click_link 'Sign Out'
	    sign_up("testing@testing.com", "password")
	    click_link 'Sunset'
			click_link 'Edit Comment'
	    expect(page).to have_content("You didn't post this")
	  end
	end

	context 'deleting a comment' do
		scenario 'as the creator' do
			sign_up("test@test.com", "password")
			add_post
			add_comment
			click_link 'Sunset'
			click_link 'Delete Comment'
			expect(page).not_to have_content 'Nice Photo'
			expect(page).to have_content 'Comment deleted successfully'
		end

	  scenario 'wnot as the creator' do
	    sign_up("test@test.com", "password")
			add_post
			add_comment
	    click_link 'Sign Out'
	    sign_up("testing@testing.com", "password")
	    click_link 'Sunset'
			click_link 'Delete Comment'
	    expect(page).to have_content("You didn't post this")
	  end
	end
end

