feature "Validating adding pictures" do
  scenario "Error if both fields left blank" do
    sign_up
    visit '/pictures/new'
    click_button "Create Picture"
    expect(page).to have_content("prohibited")
  end

  scenario "Error if title field left blank" do
    sign_up
    visit '/pictures/new'
    page.attach_file("picture[image]", Rails.root + 'app/assets/images/sloth.jpg')
    click_button "Create Picture"
    expect(page).to have_content("prohibited")
  end

  scenario "Error if image field left blank" do
    sign_up
    visit '/pictures/new'
    fill_in :"picture[title]", with: "New Title"
    click_button "Create Picture"
    expect(page).to have_content("prohibited")
  end
end
