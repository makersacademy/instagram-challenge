require 'rails_helper'
RSpec.describe do
  scenario 'signup button' do
    visit '/'
    expect(page).to have_link 'Sign Up'
  end
end