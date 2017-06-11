
def sign_up
  email = 'exemple@email.com'
  visit '/'
  click_on "Sign Up"
  fill_in "Email", :with => email
  fill_in("user[password]", with: '123456')
  fill_in("user[password_confirmation]", with: '123456')
  click_on("Sign up")
end


def sign_in
  email = 'exemple@email.com'
  visit '/'
  click_on "Sign Up"
  fill_in "Email", :with => email
  fill_in("user[password]", with: '123456')
  fill_in("user[password_confirmation]", with: '123456')
  click_on("Sign up")
  expect(page).to have_content("Welcome! You have signed up successfully.")
  click_on "Sign Out"
  visit "/"
  click_on "Log In"
  fill_in "Email", :with => email
  fill_in("user[password]", with: '123456')
  click_on "Log in"
end

def sign_out
  email = 'exemple@email.com'
  visit '/'
  click_on "Sign Up"
  fill_in "Email", :with => email
  fill_in("user[password]", with: '123456')
  fill_in("user[password_confirmation]", with: '123456')
  click_on("Sign up")
  click_on "Sign Out"
end

def add_picture
  click_on("Create new picture")
  attach_file("Image", Rails.root + 'app/assets/images/sunset.jpg')
  fill_in "Title", with: "Picture"
  fill_in "Description", with: "New picture"
  click_on("Create Pic")
end
