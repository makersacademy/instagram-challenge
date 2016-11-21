def sign_up
  user = User.create email: 'ire@test.com', password: 'password', password_confirmation: 'password'
  user.pictures.build({title: "Summer 96"})
end

def sign_in
  visit '/users/sign_in'
  fill_in "Email", with: "ire@test.com"
  fill_in "Password", with: "password"
  click_button "Log in"
end

def sign_up_and_sign_in
  sign_up
  sign_in
end

def create_picture

  # visit '/'
  # click_link('Upload a Picture')
  # fill_in "Title", with: "Summer 96"
  # click_button "Upload Picture"
end
