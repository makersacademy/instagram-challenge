require 'rails_helper'

RSpec.feature "Can add a comment", type: :feature do

  before(:each) do
    sign_up
    add_post
    add_comment
  end

  scenario "Can add a comment" do
    expect(page).to have_content("New comment")
  end

  scenario "comment count is shown" do
    fill_in "comment[content]", with: "I am comment#2"
    click_button "Create Comment"
    click_link "Back"
    expect(page).to have_content("2 Comments")
  end

  scenario "Comments are sorted by ascending age" do
    fill_in "comment[content]", with: "I am comment#2"
    click_button "Create Comment"
    alltext = page.body
    i1 = alltext.index('New comment')
    i2 = alltext.index('I am comment#2')
    expect(i2 < i1).to eq true
  end
end
