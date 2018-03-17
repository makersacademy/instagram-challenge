feature "Edit pictures" do
  scenario "Users can edit a picture" do
    create_new_picture
    click_link "Edit"
    fill_in "picture[title]", with: "Edited Picture"
    fill_in "picture[picture_url]", with: "Edited URL"
    click_on "Update Picture"
    expect(page).to have_content("Edited Picture")
    expect(page).not_to have_content("New Picture")
  end
end
