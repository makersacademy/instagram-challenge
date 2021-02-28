require 'rails_helper'

RSpec.describe 'Welcome page', type: :system do

  describe 'index page' do
    it 'will welcome users to binstagram' do
      visit ('/welcome')
      expect(page).to have_content('Welcome to Binstagram!')
    end

    it 'will route you to welcome page from "/"' do
      visit('/')
      expect(page).to have_content("Welcome to Binstagram!")
    end
  end
end
