require 'rails_helper.rb'

describe "main page upon login" do
	it "re-directs a user to the login/sign up page when they are not logged in" do
 	visit "/"
 	expect(page).to have_content("Sign up")
	end 
end 