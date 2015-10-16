require 'rails_helper'

feature 'users' do

  context 'when visiting the home page' do

    scenario 'can see a sign up link' do
      visit root_path
      expect(page).to have_link "Sign up"
    end

  end

end