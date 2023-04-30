require 'rails_helper'

feature 'Images' do

  scenario 'prompts user to Sign In or Sign Up' do
    visit '/images'
    expect(page).to have_button('Sign In')
    expect(page).to have_button('Sign Up')
  end


end
