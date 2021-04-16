require 'rails_helper'

RSpec.feature "LoggingIns", type: :feature do

  xit "user can sign in" do
    register_default_user
    expect(page).to have_content('Welcome! You have signed up successfully')
    expect(current_path).to eq('/')

    fill_in "user_email", with: DEFAULT_EMAIL
    fill_in "user_password", with: DEFAULT_PASSWORD
    find("#new_user").click
    expect(current_path).to eq('/')
  end


end
