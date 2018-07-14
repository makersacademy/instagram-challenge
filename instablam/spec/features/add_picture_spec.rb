feature "Add pictures" do
  scenario "Users can add a picture" do
    sign_up
    create_new_picture
    expect(page).to have_content("New Picture")
  end
end

feature "Adding a picture sends you to its page" do
  scenario "Users can add a picture" do
    sign_up
    create_new_picture
    expect(page).to have_current_path(/pictures\/[0-9]+/)
  end
end
