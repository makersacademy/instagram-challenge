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

  scenario "Users cannot edit other users pictures" do
    sign_up
    create_new_picture
    click_link "Back"
    click_link "Sign out"
    sign_up_bob
    visit '/pictures/1'
    expect(page).not_to have_content("Edit")
  end
end
