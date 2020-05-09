require 'rails_helper'

RSpec.feature 'Create Post', type: :feature do
  scenario 'Signed in User can create a post from hompage' do
    sign_in
    expect(page).to have_button 'Create Post'
    expect(page).not_to have_content 'Sign in'
  end
end
