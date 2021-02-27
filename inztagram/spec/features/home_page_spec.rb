# frozen_string_literal: true

require './spec/rails_help'

RSpec.feature 'Homepage', type: :feature do
  scenario 'User visits the home page and can see Welcome message' do
    visit '/'
    expect(page).to have_content('Welcome to Inztagram')
  end
end
