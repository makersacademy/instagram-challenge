require "application_system_test_case"

class PicturesTest < ApplicationSystemTestCase
  setup do
    @picture = pictures(:one)
  end

  test "visiting the index" do
    visit pictures_url
    assert_selector "h1", text: "Pictures"
  end

  test "creating a Picture" do
    visit pictures_url
    click_on "New Picture"

    fill_in "Caption", with: @picture.caption
    fill_in "Comments", with: @picture.comments
    fill_in "Likes", with: @picture.likes
    click_on "Create Picture"

    assert_text "Picture was successfully created"
    click_on "Back"
  end

  test "updating a Picture" do
    visit pictures_url
    click_on "Edit", match: :first

    fill_in "Caption", with: @picture.caption
    fill_in "Comments", with: @picture.comments
    fill_in "Likes", with: @picture.likes
    click_on "Update Picture"

    assert_text "Picture was successfully updated"
    click_on "Back"
  end

  test "destroying a Picture" do
    visit pictures_url
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Picture was successfully destroyed"
  end
end
