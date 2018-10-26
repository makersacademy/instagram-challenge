# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Homepage', type: :feature do
  scenario 'Can see app title' do
    visit '/welcome/index'
    expect(page).to have_content('Instagram')
  end
end
