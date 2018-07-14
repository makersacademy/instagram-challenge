feature "Like pictures" do

  scenario "Users can like a picture" do
    sign_up
    create_new_picture
    click_link "Back"
    click_link "Sign out"
    sign_up_bob
    visit '/pictures/1'
    click_button "Like"
    expect(page).to have_content("1 like")
  end

  scenario "Users cannot like their own pictures" do
    sign_up
    create_new_picture
    expect(page).not_to have_content("Like")
  end

end
