require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  xscenario "Asks user to add photo if timeline is empty" do
    visit "/"
    expect(page).to have_content "There are currenly no photos! Sign In or Sign Up to add one!"
  end
end
