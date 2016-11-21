require 'rails_helper'

feature "Users" do
  scenario "users can sign up" do
    skip
    visit '/signup'
    fill_in :name, with: "asda"
    fill_in :email, with: "asda@hotmail.com"
    fill_in :password, with: "asddsa"
    fill_in :password_confirmation, with: "asddsa"
    click_button "Submit"
    expect(current_path).to eq '/users/1'
    expect(page).to have_content "asda"
    expect(page).to have_content "asda@hotmail.com"
  end
end
