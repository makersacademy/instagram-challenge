require 'Rails_helper'

feature 'a user can sign up' do
	context 'when a user is not logged in' do

		it "displays a sign up link" do
			visit('/') 
			expect(page).to have_link('Sign Up')
		end

		it "should not see 'sign out' link" do
			visit('/')
			expect(page).not_to have_link('Sign out')
		end	
	end


	context "A user signed in on the hompage"  do 

		before "allows user to sign up" do
			visit('/')
			click_link("Sign Up")
			fill_in("First name", with: "Russell")
			fill_in("Last name", with: "Vaughan")
			fill_in("Username", with: "russellvaughan")
			fill_in("Email", with: "russell@example.com")
			fill_in("Password", with: "testtest")
			fill_in("Password confirmation", with: "testtest")
			click_button('Sign up')
		end	

		it "should not see 'sign out' link" do
			visit('/')
			expect(page).not_to have_link('Sign Up')
		end	

		it "should see'sign out' link" do
			visit('/')
			expect(page).to have_link('Sign Out')
			expect(page).not_to have_link('Sign In')
		end
	end
end
