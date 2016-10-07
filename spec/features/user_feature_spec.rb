require "rails_helper"

feature "user management" do

  context "user can sign up" do

    scenario "signs up successfully" do
      visit "/"
      click_link("Sign up")
      expect(page).to have_css("div#yield", text: "Sign up")

      fill_in("user_email", with: "test@test.com")
      fill_in("user_password", with: "123456")
      fill_in("user_password_confirmation", with: "123456")
      click_button("Sign up")

      expect(current_path).to eq "/"
      expect(page).to have_css("nav", text: "Signed in as test@test.com")
    end
  end

  context "user can log in and log out" do

    before do
      visit "/"
      click_link("Sign up")
      fill_in("user_email", with: "test@test.com")
      fill_in("user_password", with: "123456")
      fill_in("user_password_confirmation", with: "123456")
      click_button("Sign up")
    end

    scenario "signs in successfully" do
      visit "/"
      click_link("Log out")
      click_link("Log in")
      expect(page).to have_css("div#yield", text: "Log in")

      fill_in("user_email", with: "test@test.com")
      fill_in("user_password", with: "123456")
      click_button("Log in")

      expect(current_path).to eq "/"
      expect(page).to have_css("nav", text: "Signed in as test@test.com")
    end

    scenario "user logs out successfully" do
      visit "/"
      expect(page).to have_css("nav", text: "Log out")

      click_link("Log out")
      expect(page).to have_css("nav", text: "Log in")
      
    end

  end

end
