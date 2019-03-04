require 'rails_helper'

RSpec.feature "Sign in", type: :feature do 
  scenario "Can sign in from the welcome page" do 
    visit "/"
    
    expect(page).to have_content("Welcome to insta!")
  end
end