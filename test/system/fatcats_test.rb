require "application_system_test_case"

class FatcatsTest < ApplicationSystemTestCase
  setup do
    @fatcat = fatcats(:one)
  end

  test "visiting the index" do
    visit fatcats_url
    assert_selector "h1", text: "Fatcats"
  end

  test "creating a Fatcat" do
    visit fatcats_url
    click_on "New Fatcat"

    fill_in "Caption", with: @fatcat.caption
    click_on "Create Fatcat"

    assert_text "Fatcat was successfully created"
    click_on "Back"
  end

  test "updating a Fatcat" do
    visit fatcats_url
    click_on "Edit", match: :first

    fill_in "Caption", with: @fatcat.caption
    click_on "Update Fatcat"

    assert_text "Fatcat was successfully updated"
    click_on "Back"
  end

  test "destroying a Fatcat" do
    visit fatcats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fatcat was successfully destroyed"
  end
end
