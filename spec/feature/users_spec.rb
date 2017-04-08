require 'rails_helper'

# => TODO MVP
#
# user can be created
#
# user can sign in
#
# user can sign out


context "sign-up" do
  scenario "user can sign up" do
    visit('/users')
    expect(page).to have_content("New User")
  end
end
