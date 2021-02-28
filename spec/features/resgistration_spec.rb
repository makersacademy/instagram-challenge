require 'rails_helper'

RSpec.feature 'Registration', type: :feature do
  scenario 'Users can sign up on the sign up page' do
    sign_up
    expect(page).to have_content('Joe Bloggs')
  end
end