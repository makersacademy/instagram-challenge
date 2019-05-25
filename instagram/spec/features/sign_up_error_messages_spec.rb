require 'rails_helper'

RSpec.describe "Erro Messages during sign up", type: :feature do
  scenario "user see error message for email signup error" do
    visit("/signup")
    fill_in(:user_email, with: "a@demo.com")
    fill_in(:user_name, with: "")
    fill_in(:user_username, with: "demozz")
    fill_in(:user_password, with: "123456")
    click_button('Next')
    expect(page).to have_content("Name can't be blank")
  end

  scenario "user see error message for email signup error" do
    visit("/signup")
    fill_in(:user_email, with: "a@demo.com")
    fill_in(:user_name, with: "demo")
    fill_in(:user_username, with: "")
    fill_in(:user_password, with: "123456")
    click_button('Next')
    expect(page).to have_content("Username can't be blank")
  end

  scenario "user see error message for email signup error" do
    visit("/signup")
    fill_in(:user_email, with: "a@demo.com")
    fill_in(:user_name, with: "demo")
    fill_in(:user_username, with: "demozz")
    fill_in(:user_password, with: "")
    click_button('Next')
    expect(page).to have_content("Password can't be blank")
  end


  scenario "user see error message for email signup error" do
    visit("/signup")
    fill_in(:user_email, with: "a@demo.com")
    fill_in(:user_name, with: "demo")
    fill_in(:user_username, with: "demozz")
    fill_in(:user_password, with: "33")
    click_button('Next')
    expect(page).to have_content("Password is too short (minimum is 4 characters)")
  end

  scenario "user see error message for email signup error" do
    visit("/signup")
    fill_in(:user_email, with: "a@demo.com")
    fill_in(:user_name, with: "demo")
    fill_in(:user_username, with: "demozz")
    fill_in(:user_password, with: "33mmmmmmmmmmmmm")
    click_button('Next')
    expect(page).to have_content("Password is too long (maximum is 10 characters)")
  end
end