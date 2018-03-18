feature "Validating editing pictures" do
  scenario "Error if both fields left blank" do
    sign_up
    create_new_picture
    click_link "Edit"
    fill_in "picture[title]", with: ""
    fill_in "picture[picture_url]", with: ""
    click_on "Update Picture"
    expect(page).to have_content("prohibited")
  end

  scenario "Error if title field left blank" do
    sign_up
    create_new_picture
    click_link "Edit"
    fill_in "picture[title]", with: "New Title"
    fill_in "picture[picture_url]", with: ""
    click_on "Update Picture"
    expect(page).to have_content("prohibited")
  end

  scenario "Error if url field left blank" do
    sign_up
    create_new_picture
    click_link "Edit"
    fill_in "picture[title]", with: ""
    fill_in "picture[picture_url]", with: "New link"
    click_on "Update Picture"
    expect(page).to have_content("prohibited")
  end
end
