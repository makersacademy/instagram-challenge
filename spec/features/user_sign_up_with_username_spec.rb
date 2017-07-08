require 'rails_helper'

RSpec.describe "User sign_up", type: :feature do
  scenario "Sign up form has username fiels" do
    visit sign_up_path
    expect(page).to have_field 'Username'
  end

  scenario "User can pick a username when signin up" do
    user = create(:user)
    visit posts_path(as: user)
    expect(page).to have_content user.username
  end
end
