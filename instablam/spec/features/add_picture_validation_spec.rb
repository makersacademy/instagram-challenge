feature "Validating adding pictures" do
  scenario "Error if both fields left blank" do
    sign_up
    visit '/pictures/new'
    fill_in :"picture[title]", with: ""
    fill_in :"picture[picture_url]", with: ""
    click_button "Create Picture"
    expect(page).to have_content("prohibited")
  end

  scenario "Error if title field left blank" do
    sign_up
    visit '/pictures/new'
    fill_in :"picture[title]", with: ""
    fill_in :"picture[picture_url]", with: ""
    click_button "Create Picture"
    expect(page).to have_content("prohibited")
  end

  scenario "Error if picture_url field left blank" do
    sign_up
    visit '/pictures/new'
    fill_in :"picture[title]", with: ""
    fill_in :"picture[picture_url]", with: ""
    click_button "Create Picture"
    expect(page).to have_content("prohibited")
  end
end
