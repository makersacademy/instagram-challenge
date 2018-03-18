feature 'add new image', js: true do
  scenario 'user fills in form to add image' do
    add_an_image
    expect(page).to have_css("img[src*='Capybara.jpg']")
  end
end
