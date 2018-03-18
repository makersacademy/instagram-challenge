feature "Like pictures" do
  scenario "Users can like a picture" do
    sign_up
    create_new_picture
    click_button "Like"
    expect(page).to have_content("1 like")
  end
end
