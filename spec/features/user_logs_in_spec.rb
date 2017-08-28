require 'rails_helper.rb'
require 'spec_helper.rb'
require 'helpers/user_helper.rb'

feature 'Log In' do
  scenario 'user can log in' do
    sign_up
    log_out
    log_in
    expect(page).to have_content("Signed in successfully.")
  end
end
