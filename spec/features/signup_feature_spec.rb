require 'rails_helper'

feature 'sign up' do
  scenario 'user can sign up' do
    signup
    expect(page).to have_content 'Welcome, helloworld'
  end
end
