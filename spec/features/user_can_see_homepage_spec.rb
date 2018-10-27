# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Homepage', type: :feature do
  scenario 'Can see app title' do
    visit '/'
    expect(page).to have_content('Spacagram')
  end
end
