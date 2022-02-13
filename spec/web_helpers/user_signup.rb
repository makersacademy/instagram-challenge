def user_sign_up
  visit('users/sign_up')
  fill_in "Name", with: "T.Estman"
  fill_in "Usernname", with: "Mr T"
  fill_in "Email", with: "t@testmail.com"
  fill_in "Password", with: "123456"
  fill_in "Password confirmation", with: "123456"
  click_button "Sign up"
end