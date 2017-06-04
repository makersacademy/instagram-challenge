require 'spec_helper'
require 'rails_helper'


RSpec.feature "Sessions",  type: :feature do

  scenario "signs up the user", :type => :feature do
    email = 'exemple@email.com'
    visit '/users/sign_up'
    fill_in "Email", :with => email
    fill_in("user[password]", with: '123456')
    fill_in("user[password_confirmation]", with: '123456')
    click_on("Sign up")
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

end
