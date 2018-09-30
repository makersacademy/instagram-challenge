require "rails_helper"

RSpec.feature "Likes", type: :feature do

  before(:each) do
    visit "/"
    click_link "SignUp"

    fill_in "Email", with: "fakeuser123@email.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"

    click_link "New Post"

    fill_in "Image", with: "https://images.unsplash.com/photo-1538111167946-8e0ed8259271?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=f065d19a95cb84ff8445fd56f79d53dd&auto=format&fit=crop&w=1001&q=80"
    fill_in "Description", with: "A test description"
    click_button "Submit"
  end

  describe "when the user hasn't already liked the post" do
    scenario "it adds a like" do
      click_on(class: "like-btn")

      expect(page).to have_content("1 likes")
    end
  end
  
  describe "when the user has already liked the post" do
    scenario "it removes a like" do
      click_on(class: "like-btn")
      click_on(class: "like-btn")

      expect(page).to have_content("0 likes")
    end
  end
end