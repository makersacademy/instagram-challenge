require 'rails_helper'

RSpec.feature('Home page') do
    scenario('User vists /') do
        visit('/')
        expect(page).to have_content "Sign in"
    	expect(page).to have_content "Sign up"
    	expect(page).to have_content "Home"
    end
end

