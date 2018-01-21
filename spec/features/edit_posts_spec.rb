require 'rails_helper'

RSpec.feature "Editing posts", type: :feature do

  before(:each) do
    create_crepe_post
    visit "/"
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link "Edit"
  end

  scenario "Posts can be edited" do
    fill_in "post[caption]", with: "I love crepes"
    click_on "Update Post"
    expect(page).to have_content("Post updated")
    expect(page).to have_content("I love crepes")
    expect(page).not_to have_content("Weekend Brunch")
  end

  scenario "The file uploaded needs to be an image for post update" do
    attach_file('Image', 'spec/files/files/fake.rb')
    click_on "Update Post"
    expect(page).to have_content("Error: Please upload an image file.")
  end
end
