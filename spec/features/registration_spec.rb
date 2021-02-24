require 'rails_helper'

RSpec.feature "Registrations", type: :feature do

  it "user can register" do
    visit "/"
    click_on "Sign up"
    fill_in "user_email", with: DEFAULT_EMAIL
    fill_in "user_password", with: DEFAULT_PASSWORD
    fill_in "user_password_confirmation", with: DEFAULT_PASSWORD
    click_button "Sign up"
    expect(page).to have_content('Welcome! You have signed up successfully')
    expect(current_path).to eq('/')
  end

end
