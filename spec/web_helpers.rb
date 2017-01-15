module WebHelpers

	def sign_up
		visit "/"
		click_link "Sign Up"
		fill_in "Email", with: "toby@cat.com"
		fill_in "Password", with: "tobyspassword"
		fill_in "Password confirmation", with: "tobyspassword"
		click_button "Sign up"
	end

	def sign_in
		visit "/"
		click_link "Sign In"
		fill_in "Email", with: "toby@cat.com"
		fill_in "Password", with: "tobyspassword"
		click_button "Log in"
	end

end