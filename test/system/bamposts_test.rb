require "application_system_test_case"

class BampostsTest < ApplicationSystemTestCase
  setup do
    @bampost = bamposts(:one)
  end

  test "visiting the index" do
    visit bamposts_url
    assert_selector "h1", text: "Bamposts"
  end

  test "creating a Bampost" do
    visit bamposts_url
    click_on "New Bampost"

    fill_in "Content", with: @bampost.content
    fill_in "User", with: @bampost.user_id
    click_on "Create Bampost"

    assert_text "Bampost was successfully created"
    click_on "Back"
  end

  test "updating a Bampost" do
    visit bamposts_url
    click_on "Edit", match: :first

    fill_in "Content", with: @bampost.content
    fill_in "User", with: @bampost.user_id
    click_on "Update Bampost"

    assert_text "Bampost was successfully updated"
    click_on "Back"
  end

  test "destroying a Bampost" do
    visit bamposts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bampost was successfully destroyed"
  end
end
