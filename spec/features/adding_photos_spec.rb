feature 'Add photos to Instagram' do
  scenario 'form page has fields to add photos' do
    visit '/photos/new'
    expect(page).to have_field("photo_title")
    expect(page).to have_field("photo_description")
    expect(page).to have_field("photo_photo")
    expect(page).to have_button("Add Photo")
  end
end
