def sign_up
	visit "/"
	click_on "Sign up"
	fill_in "user[name]", with: "Test"
	fill_in "user[email]", with: "user@test.com"
	fill_in "user[password]", with: "password"
	fill_in "user[password_confirmation]", with: "password"
	click_on "Confirm"
end

# def post_image
# 	click_link "New post"
# 	fill_in "Message", with: "Hello, world!"
# 	click_button "Submit"
# end 