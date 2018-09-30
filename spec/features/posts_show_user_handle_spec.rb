require "rails_helper"

RSpec.feature "Post author", type: :feature do 

  before(:each) do
    visit "/"
    click_link "SignUp"

    fill_in "Email", with: "ThisIsAName@email.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"
  end

  scenario "posts will show user's handle" do
    click_link "New Post"
    fill_in "Image", with: "https://images.unsplash.com/photo-1538111167946-8e0ed8259271?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=f065d19a95cb84ff8445fd56f79d53dd&auto=format&fit=crop&w=1001&q=80"
    fill_in "Description", with: "A test description"
    click_button "Submit"

    expect(page).to have_content("thisisaname")
  end
end