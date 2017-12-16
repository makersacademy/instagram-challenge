feature 'Add photos to Instagram' do
  scenario 'Form page has fields to add photos' do
    visit '/photos/new'
    expect(page).to have_field("photo_title")
    expect(page).to have_field("photo_description")
    expect(page).to have_field("photo_photo")
    expect(page).to have_button("Add Photo")
  end

  scenario 'Add photo takes to index page' do
    visit '/photos/new'
    fill_in('photo_title', with: 'Beach')
    fill_in('photo_description', with: 'It\'s a very nice beach photo')
    attach_file("photo_photo", "spec/asset_specs/photos/photo.jpg")
    click_button("Add Photo")
    expect(page).to have_current_path('/photos')
  end
end
