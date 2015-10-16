module FactoryHelper

  def sign_up(user)
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: "test@testmail.com"
    fill_in "Password", with: "testtest"
    fill_in "Password confirmation", with: "testtest"
    click_button "Sign up"
  end

end
