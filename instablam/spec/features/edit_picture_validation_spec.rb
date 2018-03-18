feature "Validating editing pictures" do
  scenario "Error if both fields left blank" do
    sign_up
    create_new_picture
    click_link "Edit"
    fill_in "picture[title]", with: ""
    click_on "Update Picture"
    expect(page).to have_content("prohibited")
  end

  scenario "Error if title field left blank" do
    sign_up
    create_new_picture
    click_link "Edit"
    fill_in "picture[title]", with: ""
    page.attach_file("picture[image]", Rails.root + 'app/assets/images/sloth.jpg')
    click_on "Update Picture"
    expect(page).to have_content("prohibited")
  end

  scenario "Error if url field left blank" do
    sign_up
    create_new_picture
    click_link "Edit"
    fill_in "picture[title]", with: "New Title"
    click_on "Update Picture"
    expect(page).to have_content("prohibited")
  end
end
