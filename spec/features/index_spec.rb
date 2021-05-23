require 'rails_helper'

RSpec.feature 'Index', type: :feature do
  scenario 'Homepage /home/index' do
    visit('/')
    expect(page).to have_content('Home#index')
  end
end
