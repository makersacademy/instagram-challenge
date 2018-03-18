feature 'form validations', js: true do
  scenario 'user tries to add a new image without a caption' do
    visit '/images'
    click_button 'Add an image'
    fill_in 'image[user]', with: 'Hannah', visible: false
    click_button 'Create Image'
    expect(page).to have_content("Oops, looks like you missed something")
  end
end
