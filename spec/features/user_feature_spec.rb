require 'rails_helper'

feature 'User can sign in and out' do
	context 'user not signed in' do
		it 'should see a sign_in link and a sign up link' do
			visit '/'
			expect(page).to have_link('Sign in')
			expect(page).to have_link('Sign up')
		end

		it 'should not see a sign_out link' do
			visit '/'
			expect(page).not_to have_link('Sign out')
		end
	end

	context 'user signed in' do
		before do
			sign_up
		end

		it 'should see a sign_out link' do
			visit '/'
			expect(page).to have_link('Sign out')
		end

		it 'should not see a sign_in or sign_up link' do
			expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
		end

		it 'should see their email address' do
			expect(page).to have_content('poster@example.com')
		end

		it 'should be able to add a post and see posted by' do |variable|
			visit '/posts'
			click_on 'Add a post!'
			fill_in 'post_description', with: 'When we were at Turkey!'
			attach_file('post_image', Rails.root + "spec/fixtures/test_image.jpg")
			click_on 'Create Post'
			expect(page).to have_content('posted by poster@example.com')
		end
	end
end
