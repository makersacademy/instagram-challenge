def create_new_picture
  visit '/pictures/new'
  fill_in :"picture[title]", with: "New Picture"
  page.attach_file("picture[image]", Rails.root + 'app/assets/images/sloth.jpg')
  click_button "Create Picture"
end

def sign_up
  visit '/'
  click_link "Sign Up"
  fill_in :"user[email]", with: "jim@jim.jim"
  fill_in :"user[password]", with: "jimjim"
  fill_in :"user[password_confirmation]", with: "jimjim"
  click_button "Sign up"
end
