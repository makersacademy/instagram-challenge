require 'rails_helper'

RSpec.feature "Editing posts", type: :feature do
  scenario "Posts can be edited" do
    create_crepe_post
    visit "/"
    save_and_open_page
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link "Edit"
    fill_in "post[caption]", with: "I love crepes"
    click_on "Update Post"

    expect(page).to have_content("Post updated")
    expect(page).to have_content("I love crepes")
    expect(page).not_to have_content("Weekend Brunch")
  end
end
