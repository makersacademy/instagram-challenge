require 'rails_helper'

feature 'Users can sign in and out' do
	context 'user not signed in and on the homepage' do
		it 'should see a sign in link and a sign up link' do
			visit '/'
			expect(page).to have_link('Sign In')
			expect(page).to have_link('Sign Up')
		end	
		it 'should not see a sign out link' do
			visit '/'
			expect(page).not_to have_link('Sign Out')
		end
	end

	context 'user signed in and on the hompage' do
		it 'should see a sign out link' do
			visit '/'
			sign_up("test@test.com", "password")
			expect(page).to have_link('Sign Out')
		end
		it 'should not see a sign in link or a sign up link' do
			visit '/'
			sign_up("test@test.com", "password")
			expect(page).not_to have_link('Sign In')
			expect(page).not_to have_link('Sign Up')
		end
	end
end