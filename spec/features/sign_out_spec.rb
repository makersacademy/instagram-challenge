# frozen_string_literal: true

require 'rails_helper'
require 'test_helper'

describe 'Sign out' do
  it 'Signs a user out' do
    sign_up
    click_link 'Log out'
    expect(page).not_to have_content 'Caitlin'
  end
end
