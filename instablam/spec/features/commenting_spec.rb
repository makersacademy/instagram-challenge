feature "Comment on pictures" do
  scenario "Users can comment on a picture" do
    create_new_picture
    fill_in "comment[body]", with: "Comment!"
    click_on "Create Comment"
    expect(page).to have_content("Comment!")
  end
end
