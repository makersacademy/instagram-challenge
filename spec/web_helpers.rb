def sign_up_and_in
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