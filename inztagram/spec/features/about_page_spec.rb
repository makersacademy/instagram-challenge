# frozen_string_literal: true

require './spec/rails_help'

RSpec.feature 'About us page', type: :feature do
  scenario 'User visits the about us page and can see about us information' do
    visit '/about-us'
    expect(page).to have_content('About us')
  end
end