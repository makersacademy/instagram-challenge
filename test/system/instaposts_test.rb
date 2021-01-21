require "application_system_test_case"

class InstapostsTest < ApplicationSystemTestCase
  setup do
    @instapost = instaposts(:one)
  end

  test "visiting the index" do
    visit instaposts_url
    assert_selector "h1", text: "Instaposts"
  end

  test "creating a Instapost" do
    visit instaposts_url
    click_on "New Instapost"

    fill_in "Description", with: @instapost.description
    fill_in "Name", with: @instapost.name
    fill_in "Picture", with: @instapost.picture
    click_on "Create Instapost"

    assert_text "Instapost was successfully created"
    click_on "Back"
  end

  test "updating a Instapost" do
    visit instaposts_url
    click_on "Edit", match: :first

    fill_in "Description", with: @instapost.description
    fill_in "Name", with: @instapost.name
    fill_in "Picture", with: @instapost.picture
    click_on "Update Instapost"

    assert_text "Instapost was successfully updated"
    click_on "Back"
  end

  test "destroying a Instapost" do
    visit instaposts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Instapost was successfully destroyed"
  end
end
