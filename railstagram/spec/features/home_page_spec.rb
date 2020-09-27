require 'rails_helper'
RSpec.feature('Home page') do
    scenario('User vists /') do
        visit('/')
        expect(page).to have_content "Sign in"
    end
end
