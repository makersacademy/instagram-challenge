require 'rails_helper'

feature 'Sign up' do

  before(:each) do
    User.delete_all
  end

  scenario 'Successful sign up' do
    sign_up
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
