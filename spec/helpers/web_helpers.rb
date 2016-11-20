def sign_up_and_sign_in(email: 'marky@mark.com', password: 'secret')
  visit '/users/sign_up'
  fill_in "Email", with: email
  fill_in "Password", with: password
  fill_in "Password confirmation", with: password
  click_button 'Sign up'
end

def sign_in(email: 'marky@mark.com', password: 'secret')
  visit '/users/sign_in'
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_button 'Log in'
end

def sign_out
  click_link "Sign out"
end

def create_a_gallery(name: "GB favourites")
  visit '/galleries'
  click_link "Add a gallery"
  fill_in "Name", with: name
  click_button "Create Gallery"
end

def visit_a_gallery(name: "GB favourites")
  visit '/galleries'
  click_link(name)
end
