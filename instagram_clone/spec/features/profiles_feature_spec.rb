require 'rails_helper'

feature 'Profile page' do
  before do
    sign_up
    create_post(caption: "Jonny's post")
  end

  # scenario "Users can see their details on profile page" do
  #   click_link "Profile"
  #   expect(page).to have_content "Email: jonny@mail.com"
  # end

  scenario 'User can view their posts on a profile page' do
    click_link "Profile"
    expect(page).to have_content "Check out jonny@mail.com's posts!"
  end

  scenario "User should NOT see other user's posts on their profile page" do
    click_link 'Sign out'
    sign_up(email: "cheekyimposter@mail.com")
    click_link "Profile"
    expect(page).to have_content "cheekyimposter@mail.com's"
    expect(page).not_to have_content "Jonny's post"
  end

  # scenario "From the main posts page, users can click on an creator's email
  #           to link to their profile page" do
  #   click_link "jonny@mail.com"
  #   expect(page).to have_content "jonny@mail.com's profile page"
  # end

end
