feature "Add pictures" do
  scenario "Users can add a picture" do
    visit '/pictures/new'
    fill_in "picture[title]", with: "New Title"
    fill_in "picture[picture_url]", with: "www.imgur.com"
    click_on "Save Picture"
    expect(page).to have_content("New Title")
  end
end

feature "Adding a picture sends you to its page" do
  scenario "Users can add a picture" do
    visit '/pictures/new'
    fill_in "picture[title]", with: "New Title"
    fill_in "picture[picture_url]", with: "www.imgur.com"
    click_on "Save Picture"
    expect(page).to have_current_path(/pictures\/[0-9]+/)
  end
end
