require 'rails_helper'

feature 'user sign up' do
  scenario 'home page has link to sign up' do
    visit '/'
    expect(page).to have_link('Sign Up')
  end
end
