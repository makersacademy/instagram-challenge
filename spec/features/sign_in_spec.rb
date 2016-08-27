require 'rails_helper'

feature "Sign in page" do
  context "when first time on Instargam" do
    scenario "displays welcome message" do
      visit "/users"
      expect(page).to have_content "hello"
    end
  end
end
