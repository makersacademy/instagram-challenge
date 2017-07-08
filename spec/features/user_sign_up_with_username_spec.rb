require 'rails_helper'

RSpec.describe "User sign_up", type: :feature do
  scenario "Sign up form has username fiels" do
    visit sign_up_path
    expect(page).to have_field 'Username'
  end
end
