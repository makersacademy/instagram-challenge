require 'rails_helper'

RSpec.describe 'Home page', type: :system do

  describe 'index page' do
    visit home_index_path
    expect(page).to have_content('Welcome to Binstagram!')
  end
end
