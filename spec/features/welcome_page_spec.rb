require 'rails_helper'

RSpec.feature "Welcome page displayed", type: :feature do 
  scenario "Can visit the welcome page" do 
    visit "/"
    expect(page).to have_content("Welcome to insta!")
  end

  scenario "Is directed to welcome page is a wrong url is entered" do 
    visit "/thisisamistake"
    expect(page).to have_content("Welcome to insta!")
  end

end