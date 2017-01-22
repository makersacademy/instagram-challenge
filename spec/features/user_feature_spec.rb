require 'rails_helper'

feature "Sign Up/In/Out" do
  scenario "User only sees option to sign out if they are signed in" do
    sign_up
    expect(page).not_to have_link "Sign In"
    expect(page).not_to have_link "Register"
    expect(page).to have_link "Sign Out"
  end

  scenario "User only sees option to sign up or in if not signed in" do
    visit '/'
    expect(page).to have_link "Sign In"
    expect(page).to have_link "Register"
    expect(page).not_to have_link "Sign Out"
  end

end
