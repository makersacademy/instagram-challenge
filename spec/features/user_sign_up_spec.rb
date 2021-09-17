require 'rails_helper'

feature 'user sign up' do
  scenario 'user can sign up' do
    visit '/'
    expect(page).to have_content('Sign Up')
  end
end
