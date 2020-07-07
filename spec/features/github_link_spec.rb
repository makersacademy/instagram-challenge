require 'rails_helper'

RSpec.feature 'GitHub Repo Link', type: :feature do
  scenario 'is found on the home page' do
    visit '/'
    expect(page).to have_link 'GitHub Repo'
  end
end
