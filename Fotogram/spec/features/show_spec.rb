
feature'show' do
  scenario 'Shows the picture posted' do
    visit '/'
    click_link "New Post"
    fill_in "Title", with: "puppy"
    fill_in "Description", with: "Cute Puppy"
    click_button "Create Picture"
    expect(page).to have_content("puppy")
  end
end
