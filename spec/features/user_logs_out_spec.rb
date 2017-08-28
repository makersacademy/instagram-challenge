require 'rails_helper.rb'
require 'spec_helper.rb'
require 'helpers/user_helper.rb'

feature 'Log Out' do
  scenario 'user can log out' do
    sign_up
    log_out
    expect(page).to have_content("Signed out successfully.")
  end
end
