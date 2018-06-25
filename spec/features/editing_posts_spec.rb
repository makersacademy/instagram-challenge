# frozen_string_literal: true

require "rails_helper"

feature "Editing posts" do
  background do
    user = create(:user)
    user2 = create(:user, email: "tester@testcompany.com",
                          username: "AnotherUser",
                          id: user.id + 1)
    create(:post, user_id: user.id)
    create(:post, user_id: user.id + 1)
    sign_in user
  end

  scenario "Can edit a post" do
    find(:xpath, "//a[contains(@href,'posts/1')]", match: :prefer_exact).click

    expect(page).to have_content("Edit Post")

    click_link "Edit Post"
    fill_in "post_description", with: "This is probably a mistake"
    click_button "Update Post"

    expect(page).to have_content("Post updated")
    expect(page).to have_content("This is probably a mistake")
  end

  scenario "cannot edit a post that doesn't belong to you via url path" do
    visit "/posts/2/edit"

    expect(page.current_path).to eq root_path
    expect(page).to have_content("That post doesn't belong to you!")
  end

  scenario "cannot edit a post that doesn't belong to you via the show page" do
    find(:xpath, "//a[contains(@href,'posts/2')]").click

    expect(page).to_not have_content("Edit Post")
  end

  scenario "user tries to upload something that is not an image" do
    find(:xpath, "//a[contains(@href,'posts/1')]", match: :prefer_exact).click
    click_link "Edit Post"
    attach_file("post_image", "spec/images/wrong.zip")
    click_button "Update Post"

    expect(page).to have_content("Something is wrong with your form!")
  end
end
