require 'rails_helper'

describe 'Sign up' do
  it 'Allows a user to sign up for an account' do
    visit '/'
    expect(page).to have_content "Welcome to Instagram"
  end
end
