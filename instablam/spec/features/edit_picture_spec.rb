feature "Edit pictures" do
  scenario "Users can edit a picture" do
    sign_up
    create_new_picture
    click_link "Edit"
    fill_in "picture[title]", with: "Edited Picture"
    page.attach_file("picture[image]", Rails.root + 'app/assets/images/sloth.jpg')
    click_on "Update Picture"
    expect(page).to have_content("Edited Picture")
    expect(page).not_to have_content("New Picture")
  end
end
