require 'rails_helper'

RSpec.feature "Home" do
  scenario 'displays a welcome message' do
    visit '/'
    expect(page).to have_content('Welcome to Y33T!')
  end
end