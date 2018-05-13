RSpec.feature "Logout", type: :feature do 
  scenario "User can logout" do
    visit "/users/sign_up"
    fill_in "user_email", with: "example@example.com"
    fill_in "user_password", with: "ajdpwomakwmnd29q0jediaw"
    fill_in "user_password_confirmation", with: "ajdpwomakwmnd29q0jediaw"
    click_button "Sign up"
    page.find_by_id('log_out').click
    expect(page).to have_content("Signed out successfully")
  end 

  scenario "Logged in user can see logout link" do 
    visit "/users/sign_up"
    fill_in "user_email", with: "example@example.com"
    fill_in "user_password", with: "ajdpwomakwmnd29q0jediaw"
    fill_in "user_password_confirmation", with: "ajdpwomakwmnd29q0jediaw"
    click_button "Sign up"
    expect(page).to have_link(href: '/users/sign_out')
  end

  scenario "Cannot see logout link when not logged in" do 
    visit "/"
    expect(page).not_to have_link(href: '/users/sign_out')
  end
end