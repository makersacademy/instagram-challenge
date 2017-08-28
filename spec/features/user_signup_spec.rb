require "rails_helper"

RSpec.describe "user sign up with information", type: :feature do
  scenario "I can sign up with my details on Instagram" do
    sign_up
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
