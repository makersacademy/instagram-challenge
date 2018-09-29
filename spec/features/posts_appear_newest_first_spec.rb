require 'rails_helper'

RSpec.feature "Post order", type: :feature do

  before(:each) do
    visit "/"
    click_link "SignUp"

    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"
  end

  scenario "posts appear in reverse chronological order" do
    visit 'posts/new'
    fill_in "Image", with: "https://images.unsplash.com/photo-1538111167946-8e0ed8259271?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=f065d19a95cb84ff8445fd56f79d53dd&auto=format&fit=crop&w=1001&q=80"
    fill_in "Description", with: "First post"
    click_button "Submit"

    visit 'posts/new'
    fill_in "Image", with: "https://images.unsplash.com/photo-1538111167946-8e0ed8259271?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=f065d19a95cb84ff8445fd56f79d53dd&auto=format&fit=crop&w=1001&q=80"
    fill_in "Description", with: "Second post"
    click_button "Submit"

    expect("Second post").to appear_before("First post")
  end
end