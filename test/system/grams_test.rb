require "application_system_test_case"

class GramsTest < ApplicationSystemTestCase
  setup do
    @gram = grams(:one)
  end

  test "visiting the index" do
    visit grams_url
    assert_selector "h1", text: "Grams"
  end

  test "creating a Gram" do
    visit grams_url
    click_on "New Gram"

    click_on "Create Gram"

    assert_text "Gram was successfully created"
    click_on "Back"
  end

  test "updating a Gram" do
    visit grams_url
    click_on "Edit", match: :first

    click_on "Update Gram"

    assert_text "Gram was successfully updated"
    click_on "Back"
  end

  test "destroying a Gram" do
    visit grams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gram was successfully destroyed"
  end
end
