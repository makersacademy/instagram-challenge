feature "Comment on pictures" do

  scenario "Users can comment on a picture" do
    sign_up
    create_new_picture
    click_link "Back"
    click_link "Sign out"
    sign_up_bob
    visit '/pictures/1'
    fill_in "comment[body]", with: "Comment!"
    click_on "Create Comment"
    expect(page).to have_content("Comment!")
  end


  scenario "Users cannot comment on their own pictures" do
    sign_up
    create_new_picture
    expect(page).not_to have_content("Create Comment")
  end

end
