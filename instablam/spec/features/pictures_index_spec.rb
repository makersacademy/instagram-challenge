feature "Pictures index" do
  scenario "Pictures are display on their index page" do
    sign_up
    create_new_picture
    visit'/pictures'
    expect(page).to have_content("New Picture")
  end
end
