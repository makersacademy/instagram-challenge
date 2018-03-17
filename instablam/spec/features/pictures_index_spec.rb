feature "Pictures index" do
  scenario "Pictures are display on their index page" do
    create_new_picture
    visit'/pictures'
    expect(page).to have_content("New Picture")
  end
end
