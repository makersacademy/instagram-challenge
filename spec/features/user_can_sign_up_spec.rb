require 'rails_helper'

RSpec.feature "User can sign up", type: :feature do
  scenario 'successfully' do
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: 'testemail@gmail.com'
    fill_in "Firstname", with: "Rob"
    fill_in "Lastname", with: "Faldo"
    fill_in "Password", with: "validPassword"
    fill_in "Password confirmation", with: "validPassword"
    click_button 'Sign up'
    expect(page).to have_content("Sign Out")
  end
end
