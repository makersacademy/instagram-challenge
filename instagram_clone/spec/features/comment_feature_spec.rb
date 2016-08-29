require "rails_helper"

feature "Leaving comments" do
  context "A user would like to leave a comment" do

    before do
      sign_up
      capybara
    end

    it "A user leaves one comment" do
      visit '/'
      click_link "Comment"
      fill_in "Thoughts", with: "This is a great capybara"
      click_button "Comment"
      expect(page).to have_content("This is a great capybara")
    end
  end
end
