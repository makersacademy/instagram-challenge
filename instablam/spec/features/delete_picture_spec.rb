feature "Delete pictures" do
  scenario "Users can delete a picture" do
    sign_up
    create_new_picture
    click_link "Destroy"
    expect(page).not_to have_content("New Picture")
  end

  scenario "Users cannot delete other users pictures" do
    sign_up
    create_new_picture
    click_link "Back"
    click_link "Sign out"
    sign_up_bob
    visit '/pictures/1'
    expect(page).not_to have_content("Destroy")
  end
end
