require 'spec_helper'
require 'rails_helper'

feature "can view individual post" do

  # before do
  #   post = Post.create image: "/Users/elizabethwicks/Documents/puppy.jpg", tag: "puppy"
  # end

  scenario "show individual post" do
    visit '/posts/new'
    attach_file "Image", "/Users/elizabethwicks/Documents/puppy.jpg"
    fill_in "Tag", with: "Puppy"
    click_button "Create Post"
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page).to have_content("Puppy")
  end

end
