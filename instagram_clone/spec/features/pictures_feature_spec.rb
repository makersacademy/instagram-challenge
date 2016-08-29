require 'rails_helper'

feature "Pictures" do
  context "There aren't any pictures yet" do
    scenario "Should prompt the user to upload a picture" do
      visit '/'
      expect(page).to have_content "No one has added any pictures yet!"
      expect(page).to have_link "Add a picture!"
    end
  end
end
