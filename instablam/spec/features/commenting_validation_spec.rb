feature "Validating comments" do

  scenario "Error if body left blank" do
    sign_up
    create_new_picture
    click_link "Back"
    click_link "Sign out"
    sign_up_bob
    visit '/pictures/1'
    fill_in "comment[body]", with: ""
    click_on "Create Comment"
    expect(page).to have_content("prohibited")
  end
end
